BattleBullet = {}
local pairs = pairs
local BATTLE_CONFIG_ENUM = BATTLE_CONFIG_ENUM

function BattleBullet.InitLocalVar()
end

function BattleBullet.NewBullet(showDisplayConfig, fromUnit, defUnit, fromPos, toPos, subSkillId, skillId, speed, bulletExtraParams)
  if nil == bulletExtraParams then
    bulletExtraParams = {}
  end
  local bullet = {
    inited = false,
    speed = 0,
    speedV3 = nil,
    position = nil,
    targetPosition = nil,
    startPosition = nil,
    endPosition = nil,
    displayPosition = nil,
    useOffY = true,
    offY = 0,
    defaultBendAngle = 30,
    maxAngle = 0,
    maxEulerZ = 30,
    eulerZ = 0,
    scaleX = 1,
    mapX = nil,
    mapY = nil,
    id = nil,
    uid = nil,
    fromUid = nil,
    fromUidForCal = nil,
    fromUnitForCal = nil,
    targetUid = nil,
    buffFromAtk = {},
    model = nil,
    isDestroy = false,
    buffUidList = {},
    cachedBuffEffect = {},
    delayFrame = 0,
    damageRate = nil,
    beAffectedWithEffects = nil,
    visible = true,
    bulletEffect = nil,
    bulletScale = 1,
    sound = nil,
    hitSound = nil,
    isLine = nil,
    startPointName = "bullet_1",
    endPointName = "hit",
    startPointPositionOff = nil,
    alreadyHurt = false,
    finalDamageAddPer = 0,
    finalDamageReduceBuffPer = 0,
    finalDamageUpRatio = nil
  }
  
  function bullet:Init()
    self.subSkillId = subSkillId
    self.skillId = skillId
    self.skillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    self.fromUid = fromUnit.uid
    self.fromUidForCal = bulletExtraParams.fromUnitUid or self.fromUid
    self.targetUid = defUnit and defUnit.uid
    self.fromUnitForCal = BattleScene.GetUnitByUid(self.fromUidForCal)
    self.sound = nil
    self.hitSound = nil
    if self.fromUnitForCal:IsAlive() == false then
      self:Destroy()
      return
    end
    if defUnit and defUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    if showDisplayConfig and false == BattleMgr.isBattleServer then
      self.bulletEffect = EffectUtil.GetFullPath(showDisplayConfig.bullet_effect)
      self.bulletScale = MathUtil.TruncateFloat((showDisplayConfig.bullet_scale or 10000) / 10000)
      local hurtIndex = bulletExtraParams.hurtIndex or 1
      local bulletSound = showDisplayConfig.bullet_sound
      if bulletSound then
        self.sound = bulletSound[hurtIndex] or bulletSound[#bulletSound]
      end
      local bulletHitSound = showDisplayConfig.bullet_hit_sound
      if bulletHitSound then
        self.hitSound = bulletHitSound[hurtIndex] or bulletHitSound[#bulletHitSound]
      end
      local bend_scale = showDisplayConfig.bend_scale
      if bend_scale then
        local curScale = bend_scale[hurtIndex]
        if curScale then
          self.maxAngle = self.defaultBendAngle * curScale
          if bulletExtraParams.bendScale then
            self.maxAngle = self.maxAngle * bulletExtraParams.bendScale
          end
        end
        if 0 == self.maxAngle then
          self.isLine = true
        end
      else
        self.maxAngle = 0
        self.isLine = true
      end
      local startPoints = showDisplayConfig.start_points
      if startPoints and startPoints[hurtIndex] then
        self.startPointName = startPoints[hurtIndex]
      end
      if bulletExtraParams.startPointName then
        self.startPointName = bulletExtraParams.startPointName
      end
      local endPoints = showDisplayConfig.end_points
      if endPoints and endPoints[hurtIndex] then
        self.endPointName = endPoints[hurtIndex]
      end
    end
    if self.isLine then
      self.useOffY = false
    end
    if BattleMgr.isBattleServer ~= true then
      self:CreateModel()
    end
    if fromPos then
      self.position = {
        x = fromPos.x,
        y = fromPos.y,
        z = fromPos.z
      }
    else
      local position = fromUnit.position
      if showDisplayConfig and false == BattleMgr.isBattleServer then
        local pos = SkeletonAnimationUtil.GetPointPositionBySlotName(fromUnit.model, self.startPointName)
        if pos then
          self.startPointPositionOff = {
            x = pos.x,
            y = pos.y * BattleMgr.rotationCos,
            z = pos.y * BattleMgr.rotationSin
          }
        end
      end
      self.position = {
        x = position.x,
        y = position.y,
        z = position.z
      }
    end
    self.startPosition = {
      x = self.position.x,
      y = self.position.y,
      z = self.position.z
    }
    if toPos then
      self.endPosition = {
        x = toPos.x,
        y = toPos.y,
        z = toPos.z
      }
    else
    end
    self.speed = MathUtil.TruncateFloat(speed / BATTLE_CONFIG_ENUM.FIXED_FPS)
    self.inited = true
    self:SetPosition()
    if self.sound then
      local soundPathConfig = TableData.GetConfig(self.sound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
      end
    end
  end
  
  function bullet:CreateModel()
    self.model = ResourceManager.Instantiate(self.bulletEffect)
    local scale = self.bulletScale
    BattleResourceManager:AddGameObject(self.model, 0, 0, 0, scale, scale, scale)
  end
  
  function bullet:IsTargetInRange()
    local targetPosition = self.endPosition or defUnit.position
    local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(targetPosition, self.position)) * BattleScene.pixelsPerUnit
    return dis <= (defUnit and defUnit.coverRadiusR or 1), dis
  end
  
  function bullet:Update()
    if self.inited == false then
      if self.delayFrame then
        self.delayFrame = self.delayFrame - 1
        if self.delayFrame > 0 then
          return
        end
      end
      self:Init()
    end
    if self.isDestroy == true then
      return
    end
    self:DealMove()
  end
  
  function bullet:SetVisible(visible)
    if BattleMgr.isBattleServer == true then
      return
    end
    if self.visible ~= visible and self.model then
      self.model:SetActive(visible)
    end
    self.visible = visible
  end
  
  function bullet:DealMove()
    if defUnit and defUnit:IsAlive() == false and false == defUnit:IsRevive() then
      self:Destroy(true)
      return
    end
    self.targetPosition = self.endPosition or defUnit.position
    self.speedV3 = BattleScene.GetSpeed(self.position, self.targetPosition, self.speed)
    self.position = MathUtil.GetVector3Add(self.position, self.speedV3)
    if self:IsTargetInRange() == true then
      local isBattleServer = BattleMgr.isBattleServer
      if false == isBattleServer and defUnit then
        local model = defUnit.model or defUnit.effectModel
        if self.hitSound and model then
          local soundPathConfig = TableData.GetConfig(self.hitSound, "BaseSoundPath")
          if soundPathConfig then
            BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, model)
          end
        end
      end
      local result = self:DealHurt()
      if false == result then
        self:Destroy(true)
      else
        if false == isBattleServer then
          BulletEffectHelper.ArriveTarget(self.model, self.uid)
        end
        self:Destroy()
      end
    end
  end
  
  function bullet:DealHurt()
    if nil == defUnit then
      return false
    end
    if defUnit:IsAlive() == false then
      return false
    end
    if self.alreadyHurt == true then
      return false
    end
    local buff, effect, effectList
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(self.buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, uid in ipairs(buffUidArray) do
      buff = savedBuffList[uid]
      if buff then
        effectList = buff.effectList
        for i = 1, #effectList do
          effect = effectList[i]
          if true == effect.updateValueBeforeHurt then
            effect:UpdateValue()
          end
        end
      end
    end
    local attackUnit = self.fromUnitForCal
    local hurtNum, hurtExtraParams
    if self.skillId and self.subSkillId then
      local extraParams = {
        effectId = self.effectId,
        effectUnitUid = self.effectUnitUid,
        effectCalType = self.effectCalType,
        effectCalValue = self.effectCalValue,
        effectCalAttrId = self.effectCalAttrId,
        effectCalAttrCalType = self.effectCalAttrCalType,
        bulletUid = self.uid,
        bulletDamageRate = self.damageRate,
        beAffectedWithEffects = self.beAffectedWithEffects,
        finalValue = self.finalValue
      }
      local params
      if self.finalDamageUpRatio then
        params = {
          finalDamageUpRatio = self.finalDamageUpRatio
        }
      end
      hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(self.skillId, self.subSkillId, attackUnit, defUnit, extraParams, 1, params)
      if hurtNum then
        if hurtNum >= 0 and defUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
          BattleAction.DealMoveToAttack(attackUnit, defUnit)
        elseif hurtNum < 0 then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
            treatUnitUid = defUnit.uid,
            treatNum = -hurtNum
          })
        end
        local hurtEffectParams = {
          showDisplayConfig = showDisplayConfig,
          fromUid = self.fromUid,
          isBullet = true,
          hurtIndex = bulletExtraParams.hurtIndex or 1
        }
        local realNum = 0
        if skillId and subSkillId then
          realNum = BattleAction.DealHurt(attackUnit, defUnit, hurtNum, nil, hurtExtraParams, hurtEffectParams, self.speedV3.x < 0)
        else
        end
        local absorbHurt = hurtExtraParams.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          attackUnit:SaveSkillDamageForTestBalance(num, self.skillConfig.type)
          attackUnit:SaveDamage(num)
          defUnit:SaveDamaged(num, attackUnit.uid ~= defUnit.uid)
          if attackUnit.camp == defUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == attackUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = attackUnit.uid
            })
          end
        end
        if hurtNum >= 0 and attackUnit.camp == defUnit.enemyCamp then
          BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = attackUnit.uid
          })
        end
        if true == bulletExtraParams.rageHit and defUnit.haveRage then
          BattleAction.DealRageChange(defUnit, defUnit:GetAttr(ATTR_ENUM.rage_hit))
        end
      end
    elseif bulletExtraParams.hpValue and 0 ~= bulletExtraParams.hpValue and false == BattleBuffMgr.IsUnitUntreatable(defUnit) then
      hurtNum = bulletExtraParams.hpValue
      local realNum = BattleAction.DealHurt(attackUnit, defUnit, hurtNum)
    end
    BattleBuffMgr.TriggerBulletListener(self, BUFF_DEDUCE_TYPE.BULLET_HURT)
    if self.skillId and self.subSkillId then
      if hurtExtraParams.counter then
        local counterValue = hurtExtraParams.counter.counterValue
        if counterValue and true == attackUnit:CanTargetChosen() then
          local counterEffectParams
          if hurtExtraParams.counter.counterEffectPath then
            counterEffectParams = {
              effectPath = hurtExtraParams.counter.counterEffectPath
            }
          end
          local realNum = BattleAction.DealHurt(defUnit, attackUnit, counterValue, nil, nil, counterEffectParams)
          local absorbHurt = hurtExtraParams.counter.absorbHurt or 0
          local num = realNum + absorbHurt
          if 0 ~= num then
            defUnit:SaveSkillDamageForTestBalance(num)
            defUnit:SaveDamage(num)
            attackUnit:SaveDamaged(num)
            if defUnit.camp == attackUnit.enemyCamp then
              BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
            end
            if false == defUnit.isBuilding and defUnit.uid ~= attackUnit.uid then
              BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
                hurtFromUnitUid = defUnit.uid
              })
            end
          end
          if defUnit.camp == attackUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
              hurtFromUnitUid = defUnit.uid
            })
          end
        end
      end
      local isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddBulletTargetUid(defUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(defUnit, true, nil, nil, nil, nil, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInBulletTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, defUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.GROW_CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddBulletTargetUid(defUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(defUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInBulletTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nil == nextUnit then
          nextUnit = nearUnitList[1]
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, defUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          local finalDamageAddPer = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.GROW_CATAPULT_DAMAGE)
          if finalDamageAddPer then
            nextBullet.finalDamageAddPer = nextBullet.finalDamageAddPer + finalDamageAddPer
          end
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddBulletTargetUid(defUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(defUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInBulletTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nil == nextUnit then
          nextUnit = nearUnitList[1]
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, defUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          local finalDamageReducePer = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE)
          if finalDamageReducePer then
            nextBullet.finalDamageReduceBuffPer = nextBullet.finalDamageReduceBuffPer + finalDamageReducePer
          end
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.CATAPULT_TAG, self, true)
      if isContain then
        local nearUnitList = BattleChoose.GetNearestUnit(defUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit = nearUnitList[1]
        if nextUnit then
          local tempBuff = buffs[1]
          local buffConfig = tempBuff.buffConfig
          if buffConfig.extra_param then
            local param = Split(buffConfig.extra_param, ":")
            if #param < 2 then
              printError("参数错误：", buffConfig.extra_param)
            else
              local extra_showDisplayId = tonumber(param[1])
              local extra_showDisplayConfig, _speed
              if 0 == extra_showDisplayId then
                extra_showDisplayConfig = showDisplayConfig
                _speed = speed
              else
                extra_showDisplayConfig = TableData.GetConfig(extra_showDisplayId, "BaseSkillShowDisplay")
                _speed = extra_showDisplayConfig.bullet_speed
              end
              if extra_showDisplayConfig then
                local bulletSubSkillId
                local bulletHurtPoint = extra_showDisplayConfig.hurt_point
                if bulletHurtPoint then
                  bulletSubSkillId = tonumber(Split(bulletHurtPoint[1], ":")[2])
                end
                if bulletSubSkillId then
                  bulletExtraParams.fromUnitUid = self.fromUidForCal
                  local nextBullet = BattleBullet.NewBullet(extra_showDisplayConfig, defUnit, nextUnit, nil, nil, bulletSubSkillId, skillId, _speed, bulletExtraParams)
                  BattleScene.AddBullet(nextBullet)
                  BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
                  local buffId = tonumber(param[2])
                  local newBuff = BattleBuffMgr.NewBuff(buffId, {
                    unitUid = fromUnit.uid
                  }, {
                    bulletUid = nextBullet.uid
                  }, true)
                  newBuff:AddBulletTargetUid(defUnit.uid)
                end
              end
            end
          end
        end
      end
    end
    self.alreadyHurt = true
  end
  
  function bullet:AddBuff(uid)
    self.buffUidList[uid] = 1
    self:UpdateCachedBuffEffect()
  end
  
  function bullet:RemoveBuff(uid)
    self.buffUidList[uid] = nil
    self:UpdateCachedBuffEffect()
  end
  
  function bullet:UpdateCachedBuffEffect()
    local buffUidList = self.buffUidList
    local effectId, buff, effect, effectList
    local cachedList = {}
    local cachedEffectList
    local savedBuffList = BattleBuffMgr.savedBuffList
    for buffUid, enable in pairs(buffUidList) do
      buff = savedBuffList[buffUid]
      effectList = buff.effectList
      for i = 1, #effectList do
        effect = effectList[i]
        effectId = effect.effectId
        cachedEffectList = cachedList[effectId] or {}
        cachedEffectList[#cachedEffectList + 1] = effect
        cachedList[effectId] = cachedEffectList
      end
    end
    self.cachedBuffEffect = cachedList
  end
  
  function bullet:SetPosition()
    if BattleMgr.isBattleServer == true then
      return
    end
    local displayStartPosition
    if self.startPointPositionOff then
      displayStartPosition = MathUtil.GetVector3Add(self.startPosition, self.startPointPositionOff)
    else
      displayStartPosition = self.startPosition
    end
    local startModel = fromUnit.model
    if nil == startModel then
      local effect = fromUnit.effectModel
      local trans = LuaUtil.FindChild(effect.transform, "bullet", true)
      if trans then
        local localPosition = trans.localPosition
        displayStartPosition.x = displayStartPosition.x + localPosition.x
        displayStartPosition.y = displayStartPosition.y + localPosition.y
        displayStartPosition.z = displayStartPosition.z + localPosition.z
      end
      startModel = effect
    end
    LuaUtil.SetLocalPos(self.model, displayStartPosition.x, displayStartPosition.y, displayStartPosition.z)
    if defUnit then
      BulletEffectHelper.SetBulletHelper(self.model, startModel, defUnit.model or defUnit.effectModel, MathUtil.TruncateFloat(speed / BattleScene.pixelsPerUnit), self.endPointName, self.maxAngle)
    else
      BulletEffectHelper.SetBulletHelper(self.model, startModel, Vector3(self.endPosition.x, self.endPosition.y, self.endPosition.z), MathUtil.TruncateFloat(speed / BattleScene.pixelsPerUnit), self.endPointName, self.maxAngle)
    end
    BulletEffectHelper.SetBulletUid(self.model, self.uid)
  end
  
  function bullet:UpdateSortingOrder()
  end
  
  function bullet:Destroy(inBattleClear, battleOverClear)
    if true ~= battleOverClear then
      self:RemoveAllBuff()
      BattleScene.RemoveBullet(self.uid)
    end
    self.isDestroy = true
    if self.model then
      if inBattleClear or battleOverClear then
        BulletEffectHelper.ResetBulletHelper(self.model)
        BattleResourceManager:DestroyGameObject(self.model)
      end
      self.model = nil
    end
    self = nil
  end
  
  function bullet:RemoveAllBuff()
    local buff
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(self.buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, buffUid in ipairs(buffUidArray) do
      buff = savedBuffList[buffUid]
      if buff then
        buff:Remove()
      end
    end
    self.buffUidList = {}
  end
  
  bullet.uid = BattleScene.GetBulletGlobalIndex()
  bullet.delayFrame = bulletExtraParams.delayFrame or 0
  local effectList = bulletExtraParams.effectList
  if effectList and effectList[1] then
    bullet.effectId = effectList[1].effectId
    bullet.effectUnitUid = effectList[1].fromUnitUid
    bullet.effectCalType = effectList[1].effectCalType
    bullet.effectCalValue = effectList[1].effectCalValue
    bullet.effectCalAttrId = effectList[1].effectCalAttrId
    bullet.effectCalAttrCalType = effectList[1].effectCalAttrCalType
    bullet.finalValue = effectList[1].finalValue
  end
  bullet.beAffectedWithEffects = bulletExtraParams.beAffectedWithEffects
  bullet.damageRate = bulletExtraParams.mainDamageRate or bulletExtraParams.transferDamageRate
  if 0 == bullet.delayFrame then
    bullet:Init()
  end
  return bullet
end
