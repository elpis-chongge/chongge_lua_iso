BattleManuallySkill = {}
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE

function BattleManuallySkill.InitLocalVar()
end

function BattleManuallySkill.NewSkill(skillId, skillLevel, camp)
  local skill = {
    uid = nil,
    skillId = nil,
    skillLevel = nil,
    skillType = nil,
    position = nil,
    isActive = nil,
    effect = nil,
    elementTypes = nil,
    skillAtk = nik,
    skillTotalFrame = nil,
    curSkillFrame = nil,
    attackPointList = nil,
    attackSoundList = nil,
    waitCDFrame = nil,
    camp = nil,
    enemyCamp = nil,
    damageRecord = 0,
    treatRecord = 0,
    shieldRecord = 0,
    skillEffectType = nil,
    tempSort = nil,
    activeCount = 0,
    maxActiveCount = 0,
    savedTriggerList = {},
    cachedSkillConfig = nil,
    cachedSkillShowConfig = nil,
    cachedSkillShowDisplayConfig = nil,
    cachedSkillLevelUpConfigs = {},
    preloadEffect = {}
  }
  
  function skill:GetSkillConfig()
    if self.cachedSkillConfig == nil then
      self.cachedSkillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    end
    return self.cachedSkillConfig
  end
  
  function skill:GetSkillLevelUpConfig()
    local key = self.skillId
    if self.cachedSkillLevelUpConfigs[key] == nil then
      self.cachedSkillLevelUpConfigs[key] = TableData.GetConfig(key * 1000 + self.skillLevel, "BaseSkillLevelUp")
    end
    return self.cachedSkillLevelUpConfigs[key]
  end
  
  function skill:GetSkillShowConfig()
    if self.cachedSkillShowConfig == nil then
      self.cachedSkillShowConfig = TableData.GetConfig(self:GetSkillLevelUpConfig().show_id, "BaseSkillShow")
    end
    return self.cachedSkillShowConfig
  end
  
  function skill:GetSkillShowDisplayConfig()
    if self.cachedSkillShowDisplayConfig == nil then
      local skillShowConfig = self:GetSkillShowConfig()
      self.cachedSkillShowDisplayConfig = TableData.GetConfig(skillShowConfig.display_ids[1], "BaseSkillShowDisplay")
    end
    return self.cachedSkillShowDisplayConfig
  end
  
  function skill:GetSkillTotalFrame()
    if self.skillTotalFrame == nil then
      local showConfig = self:GetSkillShowConfig()
      if showConfig then
        self.skillTotalFrame = showConfig.total_f
      end
    end
    return self.skillTotalFrame
  end
  
  function skill:Init()
    self.skillId = skillId
    self.skillLevel = skillLevel
    self.uid = BattleScene.GetManuallySkillGlobalIndex()
    self.camp = camp
    if camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
    else
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
    end
    local config = self:GetSkillConfig()
    self.skillConfig = config
    self.skillAtk = config.skill_atk
    self.skillType = config.type
    self.skillEffectType = config.tactic_type
    self.elementTypes = config.element_type or {}
    self.cd = config.cd * BATTLE_CONFIG_ENUM.FIXED_FPS
    local skillLevelUpConfig = self:GetSkillLevelUpConfig()
    self.maxActiveCount = skillLevelUpConfig.trigger_max
    if BattleMgr.isBattleServer == false then
      local showDisplayConfig = self:GetSkillShowDisplayConfig()
      if showDisplayConfig.effect then
        table.insert(self.preloadEffect, EffectUtil.GetFullPath(showDisplayConfig.effect))
      end
    end
  end
  
  function skill:GetSkillAtk()
    return self.skillAtk
  end
  
  function skill:CanAutoChosen()
    if self.activeCount >= self.maxActiveCount then
      return false
    end
    if self.waitCDFrame then
      return false
    end
    if 1 == self.skillEffectType or 2 == self.skillEffectType or 3 == self.skillEffectType or 4 == self.skillEffectType or 5 == self.skillEffectType then
      local burst = BattleScene.GetBurst(self.camp)
      if burst:GetEnergySkillState() ~= BATTLE_BURST_STATE.ACTIVATED then
        return false
      end
      local autoManuallySkillCache = burst.autoManuallySkillCache
      if table.contain(autoManuallySkillCache, self.skillId) then
        return false
      end
      burst:SaveAutoManuallySkill(self.skillId)
    elseif 6 == self.skillEffectType then
      local allUnit = BattleScene.GetUnitListByCampForManuallySkill2(self.camp)
      if #allUnit <= 0 then
        return false
      end
      local hpPer = 0
      for i, v in ipairs(allUnit) do
        hpPer = hpPer + v.tempHpPer
      end
      if hpPer / #allUnit >= 0.5 then
        return false
      end
    end
    return true
  end
  
  function skill:SetAutoPosition()
    local tempCenterList = {}
    local allUnit
    if 1 == self.skillEffectType or 4 == self.skillEffectType or 5 == self.skillEffectType then
      allUnit = BattleScene.GetUnitListByCampForManuallySkill(self.enemyCamp)
    elseif 2 == self.skillEffectType or 3 == self.skillEffectType or 6 == self.skillEffectType then
      allUnit = BattleScene.GetUnitListByCampForManuallySkill(self.camp)
    end
    if #allUnit < 1 then
      return false
    end
    if 1 == #allUnit then
      self:SetPosition(allUnit[1].position)
      return true
    end
    local maxUnitCount = 0
    for _, unitA in ipairs(allUnit) do
      for _, unitB in ipairs(allUnit) do
        if unitA.uid ~= unitB.uid then
          local unitList, centerX, centerY, centerZ = self:GetPositionBetweenTwoUnit(unitA, unitB)
          maxUnitCount = math.max(maxUnitCount, #unitList)
          table.insert(tempCenterList, {
            unitList = unitList,
            unitCount = #unitList,
            position = {
              x = centerX,
              y = centerY,
              z = centerZ
            }
          })
        end
      end
    end
    if #tempCenterList < 1 then
      return false
    end
    if 1 == #tempCenterList then
      self:SetPosition(tempCenterList[1].position)
      return true
    end
    table.sort(tempCenterList, function(a, b)
      return a.unitCount > b.unitCount
    end)
    local second = tempCenterList[2]
    if maxUnitCount > second.unitCount then
      self:SetPosition(tempCenterList[1].position)
      return true
    end
    local targetPosition
    if 1 == self.skillEffectType then
      for _, v in ipairs(tempCenterList) do
        table.sort(v.unitList, function(a, b)
          return a.tempHpPer < b.tempHpPer
        end)
        v.tempRandom = BattleData.GetRandomForAutoSkill()
      end
      table.sort(tempCenterList, function(a, b)
        if a.unitCount ~= b.unitCount then
          return a.unitCount > b.unitCount
        else
          for index = 1, a.unitCount do
            if a.unitList[index].tempHpPer < b.unitList[index].tempHpPer then
              return true
            elseif a.unitList[index].tempHpPer > b.unitList[index].tempHpPer then
              return false
            end
          end
          return a.tempRandom < b.tempRandom
        end
      end)
      targetPosition = tempCenterList[1].position
    else
      for _, v in ipairs(tempCenterList) do
        v.supportCount = 0
        v.rangedCount = 0
        v.meleeCount = 0
        v.defenseCount = 0
        for _, unit in ipairs(v.unitList) do
          local battleUnitType = unit.battleUnitType
          if battleUnitType == BATTLE_UNIT_TYPE.SUPPORT then
            v.supportCount = v.supportCount + 1
          elseif battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
            v.rangedCount = v.rangedCount + 1
          elseif battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
            v.meleeCount = v.meleeCount + 1
          elseif battleUnitType == BATTLE_UNIT_TYPE.DEFENSE then
            v.defenseCount = v.defenseCount + 1
          end
        end
        v.tempRandom = BattleData.GetRandomForAutoSkill()
      end
      if 2 == self.skillEffectType then
        table.sort(tempCenterList, function(a, b)
          if a.unitCount ~= b.unitCount then
            return a.unitCount > b.unitCount
          elseif a.supportCount ~= b.supportCount then
            return a.supportCount > b.supportCount
          elseif a.rangedCount ~= b.rangedCount then
            return a.rangedCount > b.rangedCount
          elseif a.meleeCount ~= b.meleeCount then
            return a.meleeCount > b.meleeCount
          elseif a.defenseCount ~= b.defenseCount then
            return a.defenseCount > b.defenseCount
          else
            return a.tempRandom < b.tempRandom
          end
        end)
        targetPosition = tempCenterList[1].position
      elseif 3 == self.skillEffectType then
        table.sort(tempCenterList, function(a, b)
          if a.unitCount ~= b.unitCount then
            return a.unitCount > b.unitCount
          elseif a.defenseCount ~= b.defenseCount then
            return a.defenseCount > b.defenseCount
          elseif a.meleeCount ~= b.meleeCount then
            return a.meleeCount > b.meleeCount
          elseif a.supportCount ~= b.supportCount then
            return a.supportCount > b.supportCount
          elseif a.rangedCount ~= b.rangedCount then
            return a.rangedCount > b.rangedCount
          else
            return a.tempRandom < b.tempRandom
          end
        end)
        targetPosition = tempCenterList[1].position
      elseif 4 == self.skillEffectType then
        table.sort(tempCenterList, function(a, b)
          if a.unitCount ~= b.unitCount then
            return a.unitCount > b.unitCount
          elseif a.supportCount ~= b.supportCount then
            return a.supportCount > b.supportCount
          elseif a.rangedCount ~= b.rangedCount then
            return a.rangedCount > b.rangedCount
          elseif a.meleeCount ~= b.meleeCount then
            return a.meleeCount > b.meleeCount
          elseif a.defenseCount ~= b.defenseCount then
            return a.defenseCount > b.defenseCount
          else
            return a.tempRandom < b.tempRandom
          end
        end)
        targetPosition = tempCenterList[1].position
      elseif 5 == self.skillEffectType then
        table.sort(tempCenterList, function(a, b)
          if a.unitCount ~= b.unitCount then
            return a.unitCount > b.unitCount
          elseif a.defenseCount ~= b.defenseCount then
            return a.defenseCount > b.defenseCount
          elseif a.meleeCount ~= b.meleeCount then
            return a.meleeCount > b.meleeCount
          elseif a.supportCount ~= b.supportCount then
            return a.supportCount > b.supportCount
          elseif a.rangedCount ~= b.rangedCount then
            return a.rangedCount > b.rangedCount
          else
            return a.tempRandom < b.tempRandom
          end
        end)
        targetPosition = tempCenterList[1].position
      elseif 6 == self.skillEffectType then
        table.sort(tempCenterList, function(a, b)
          if a.unitCount ~= b.unitCount then
            return a.unitCount > b.unitCount
          elseif a.rangedCount ~= b.rangedCount then
            return a.rangedCount > b.rangedCount
          elseif a.supportCount ~= b.supportCount then
            return a.supportCount > b.supportCount
          elseif a.meleeCount ~= b.meleeCount then
            return a.meleeCount > b.meleeCount
          elseif a.defenseCount ~= b.defenseCount then
            return a.defenseCount > b.defenseCount
          else
            return a.tempRandom < b.tempRandom
          end
        end)
        targetPosition = tempCenterList[1].position
      end
    end
    if targetPosition then
      self:SetPosition(targetPosition)
      return true
    end
  end
  
  function skill:GetPositionBetweenTwoUnit(unitA, unitB)
    local rangeType, rangeX, rangeY = self:GetRange()
    local centerX, centerY, centerZ
    if unitA.uid == unitB.uid then
      centerX = unitA.position.x
      centerZ = unitA.position.z
    elseif 1 == rangeType then
      if unitA.coverRadiusR and unitB.coverRadiusR then
        local distanceAToB = unitA.cachedDistance[unitB.uid] + unitA.coverRadiusR + unitB.coverRadiusR
        if 0 ~= distanceAToB then
          local ratio = MathUtil.TruncateFloatN((unitA.coverRadiusR + rangeX) / distanceAToB, 6)
          centerX = (unitB.position.x - unitA.position.x) * ratio + unitA.position.x
          centerZ = (unitB.position.z - unitA.position.z) * ratio + unitA.position.z
        else
          centerX = unitA.position.x
          centerZ = unitA.position.z
        end
      else
        centerX = unitA.position.x
        centerZ = unitA.position.z
      end
    elseif 2 == rangeType then
      centerX = unitA.position.x
      centerZ = unitA.position.z
    end
    centerX = MathUtil.TruncateFloatN(centerX, 6)
    centerZ = MathUtil.TruncateFloatN(centerZ, 6)
    self:SetPosition({
      x = centerX,
      y = 0,
      z = centerZ
    })
    local inRangeUnit = self:GetAvailableTargets()
    self.position = nil
    centerY = 0
    if #inRangeUnit > 1 then
      return inRangeUnit, centerX, centerY, centerZ
    else
      return inRangeUnit, unitA.position.x, centerY, unitA.position.z
    end
  end
  
  function skill:Update()
    local waitCDFrame = self.waitCDFrame
    if nil ~= waitCDFrame and waitCDFrame > 0 then
      waitCDFrame = waitCDFrame - 1
      if waitCDFrame <= 0 then
        waitCDFrame = nil
      end
      self.waitCDFrame = waitCDFrame
    end
    if self.isActive == true then
      local curSkillFrame = self.curSkillFrame
      if nil == curSkillFrame then
        self.activeCount = self.activeCount + 1
        curSkillFrame = 1
        self.savedTriggerList[#self.savedTriggerList + 1] = {
          frame = BattleControl.curFixedFrame
        }
        local skillLevelUpConfig = self:GetSkillLevelUpConfig()
        BattleBuffMgr.GetAllBuff(skillLevelUpConfig, {
          skillCamp = self.camp,
          manuallySkillId = self.skillId
        }, nil, true)
        if skillLevelUpConfig.summon_id then
          local pos
          local index = self.activeCount
          local count = #skillLevelUpConfig.summon_id
          index = math.min(count, index)
          local summon_id_list = Split(skillLevelUpConfig.summon_id[index], ":")
          local summon_site_list
          if skillLevelUpConfig.summon_site then
            summon_site_list = Split(skillLevelUpConfig.summon_site[index], ":")
          end
          for i = 1, #summon_id_list do
            if summon_site_list then
              pos = tonumber(summon_site_list[i])
            end
            self:DealSummon(tonumber(summon_id_list[i]), pos)
          end
        end
        local curShowDisplayConfig = self:GetSkillShowDisplayConfig()
        if nil == self.attackPointList then
          local hurt_point = curShowDisplayConfig.hurt_point
          if hurt_point then
            local attackPointList = {}
            local strList
            for i = 1, #hurt_point do
              strList = Split(hurt_point[i], ":")
              attackPointList[tonumber(strList[1])] = tonumber(strList[2])
            end
            self.attackPointList = attackPointList
          end
        end
      end
      if self.attackPointList then
        local subSkillId = self.attackPointList[curSkillFrame]
        if nil ~= subSkillId then
          local inRangeUnit = self:GetAvailableTargets()
          local hurtNum, hurtExtraParams, targetUnit
          for i = 1, #inRangeUnit do
            targetUnit = inRangeUnit[i]
            hurtNum, hurtExtraParams = self:GetHurt(targetUnit, subSkillId)
            if hurtNum then
              local realNum = BattleAction.DealHurt(nil, targetUnit, hurtNum, nil, hurtExtraParams)
              targetUnit:SaveDamaged(realNum, true)
              self:SaveDamage(realNum)
            end
          end
        end
      end
      curSkillFrame = curSkillFrame + 1
      self.curSkillFrame = curSkillFrame
      local curTotalFrame = self:GetSkillTotalFrame()
      if curSkillFrame > curTotalFrame then
        self:ClearData()
      end
    end
  end
  
  function skill:TriggerSkillBuff()
    local skillLevelUpConfig = self:GetSkillLevelUpConfig()
    BattleBuffMgr.GetAllBuff(skillLevelUpConfig, {
      skillCamp = self.camp,
      manuallySkillId = self.skillId
    }, nil, true)
  end
  
  function skill:DealSummon(summonId, pos)
    local summonConfig = TableData.GetConfig(summonId, "BaseSkillSummon")
    local param = {
      summonId = summonId,
      camp = self.camp,
      position = {
        x = self.position.x + summonConfig.monster_pos[1],
        y = 0,
        z = self.position.z + summonConfig.monster_pos[2]
      },
      pos = pos,
      state = BATTLE_STATE_ENUM.STAND,
      summonFromSkill = self.skillId
    }
    BattleAction.DealSummon(param)
  end
  
  function skill:GetHurt(defUnit, subSkillId)
    return BattleDataCount.GetManuallySkillHurt(self, subSkillId, defUnit.uid)
  end
  
  function skill:SetWaitCDFrame()
    self.waitCDFrame = self.cd
  end
  
  function skill:SetPosition(pos, directUse)
    self.position = {
      x = MathUtil.TruncateFloatN(pos.x, 6),
      y = MathUtil.TruncateFloatN(pos.y, 6),
      z = MathUtil.TruncateFloatN(pos.z, 6)
    }
  end
  
  function skill:SetActive(active)
    self.isActive = active
    if true == active then
      self.waitCDFrame = nil
    end
  end
  
  function skill:GetAvailableTargets()
    local targetId = self:GetSkillLevelUpConfig().target_type
    local targetUnitList = BattleChoose.GetTargetUnitList(targetId, {
      skillCamp = skill.camp,
      manuallySkillId = self.skillId
    }, {})
    return targetUnitList
  end
  
  function skill:GetInRangeUnit(unitCamp, includeBuilding)
    unitCamp = unitCamp or self.enemyCamp
    local inRangeUnit = {}
    local allUnit = BattleScene.GetAllAliveUnit()
    for i = 1, #allUnit do
      local v = allUnit[i]
      if (true == includeBuilding or true ~= v.isBuilding) and true == v:CanRangeChosen() and v.camp == unitCamp and true == self:IsTargetInRange(v.uid) then
        inRangeUnit[#inRangeUnit + 1] = v
      end
    end
    return inRangeUnit
  end
  
  function skill:IsTargetInRange(targetUid)
    local target = BattleScene.GetUnitByUid(targetUid)
    local rangeType, rangeX, rangeY = self:GetRange()
    local targetPosX = target.position.x
    local targetPosY = target.position.y
    local targetPosZ = target.position.z
    local pixelsPerUnit = BattleScene.pixelsPerUnit
    local abs = math.abs
    local _position = self.position
    if 1 == rangeType then
      if target.coverRadiusR then
        local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(target.position, _position)) * pixelsPerUnit
        return rangeX >= dis - target.coverRadiusR
      else
        return rangeX >= abs(_position.x - targetPosX) * pixelsPerUnit - target.coverRadiusHalfW and rangeX >= abs(_position.z - targetPosZ) * pixelsPerUnit - target.coverRadiusHalfH
      end
    elseif 2 == rangeType then
      return rangeX >= abs(_position.x - targetPosX) * pixelsPerUnit - (target.coverRadiusR or target.coverRadiusHalfW) and rangeY >= abs(_position.z - targetPosZ) * pixelsPerUnit - (target.coverRadiusR or target.coverRadiusHalfH)
    end
  end
  
  function skill:GetRange()
    local skillLevelUpConfig = self:GetSkillLevelUpConfig()
    return skillLevelUpConfig.range_type, skillLevelUpConfig.range_x, skillLevelUpConfig.range_y
  end
  
  function skill:IsEffective()
    return BattleData.IsEffectSkill(self.skillEffectType)
  end
  
  function skill:UpdateDisplay()
    if self.position == nil then
      return
    end
    if self.isActive ~= true then
      local allUnit = self:GetAvailableTargets()
      local color
      if self:IsEffective() then
        color = {
          r = 0,
          g = 510,
          b = 0,
          a = 255
        }
      else
        color = {
          r = 510,
          g = 0,
          b = 0,
          a = 255
        }
      end
      local v
      for i = 1, #allUnit do
        v = allUnit[i]
        if v:IsDead() == false then
          v:UpdateShowInSkillRange(true, color)
        end
      end
    elseif nil == self.effect then
      local showDisplayConfig = self:GetSkillShowDisplayConfig()
      self.effect = ResourceManager.Instantiate(EffectUtil.GetFullPath(showDisplayConfig.effect))
      local rangeType, rangeX, rangeY = self:GetRange()
      local scale = 1
      if 1 == rangeType then
        scale = rangeX / BattleScene.pixelsPerUnit / 10
      end
      BattleResourceManager:AddGameObject(self.effect, self.position.x, self.position.y, self.position.z, scale, scale, scale)
      local sound = showDisplayConfig.sound
      if sound then
        local soundPathConfig
        for i = 1, #sound do
          soundPathConfig = TableData.GetConfig(sound[i], "BaseSoundPath")
          if soundPathConfig then
            SoundUtil.PlaySfxInBattle(soundPathConfig.path, soundPathConfig.bank, self.effect)
          end
        end
      end
      EffectUtil.SetAutoDestroyCallback(self.effect, function()
        if BattleControl.isOver == true then
          return
        end
        if self.effect then
          BattleResourceManager:DestroyGameObject(self.effect)
          self.effect = nil
        end
      end, self:GetSkillTotalFrame() / BATTLE_CONFIG_ENUM.FIXED_FPS)
    end
  end
  
  function skill:SaveDamage(damage)
    if damage > 0 then
      self.damageRecord = self.damageRecord + damage
    else
      self.treatRecord = self.treatRecord - damage
    end
  end
  
  function skill:SaveShield(shield)
    self.shieldRecord = self.shieldRecord + shield
  end
  
  function skill:ClearData()
    self.position = nil
    self.curSkillFrame = nil
    self.attackPointList = nil
    self.attackSoundList = nil
    self.isActive = nil
  end
  
  function skill:Destroy()
    self.savedTriggerList = nil
    self.skillId = nil
    self.skillConfig = nil
    self:ClearData()
    self = nil
  end
  
  skill:Init()
  return skill
end

function BattleManuallySkill.GetMinHpRangeUnit(atkUnit, isSameSide)
  local unitList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide)
  local sort1List, sort2List = {}, {}
  for i, v in ipairs(unitList) do
    if v.isSupportOrRanged then
      sort1List[#sort1List + 1] = v
    else
      sort2List[#sort2List + 1] = v
    end
    v.tempRandom = BattleData.GetRandomForAutoSkill()
  end
  if #sort1List > 0 then
    table.sort(sort1List, function(a, b)
      if a.tempHpPer == b.tempHpPer then
        return a.tempRandom < b.tempRandom
      else
        return a.tempHpPer < b.tempHpPer
      end
    end)
    return sort1List[1]
  elseif #sort2List > 0 then
    table.sort(sort2List, function(a, b)
      if a.tempHpPer == b.tempHpPer then
        return a.tempRandom < b.tempRandom
      else
        return a.tempHpPer < b.tempHpPer
      end
    end)
    return sort2List[1]
  end
  return nil
end
