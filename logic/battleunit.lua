BattleUnit = {}
local RestraintAddName = {
  "restraint_add1",
  "restraint_add2",
  "restraint_add3",
  "restraint_add4",
  "restraint_add5"
}
local RestraintSubName = {
  "restraint_sub1",
  "restraint_sub2",
  "restraint_sub3",
  "restraint_sub4",
  "restraint_sub5"
}
local battleCamera, hudCom

function BattleUnit.InitLocalVar()
  if BattleMgr.isBattleServer == false then
    battleCamera = BattleCamera
    hudCom = UIMgr:GetLayerRoot("HUD")
  end
end

function BattleUnit.NewUnit(data)
  local unit = {}
  local invisibleOff
  local ATTR_ENUM = ATTR_ENUM
  local ATTR_ID = ProtoEnum.ATTR_ID
  local TRIGGER_CONDITION = TRIGGER_CONDITION
  local BATTLE_STATE_ENUM = BATTLE_STATE_ENUM
  local BATTLE_CONFIG_ENUM = BATTLE_CONFIG_ENUM
  local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE
  local BATTLE_BUILDING_TYPE = BATTLE_BUILDING_TYPE
  local BUFF_EFFECT_VALUE = BUFF_EFFECT_VALUE
  local BATTLE_DEPEND_TYPE = BATTLE_DEPEND_TYPE
  local BATTLE_SKILL_ENUM = SKILL_TYPE_ENUM
  local abs = math.abs
  local ceil = math.ceil
  local floor = math.floor
  local pairs = pairs
  local tonumber = tonumber
  local isBattleServer = BattleMgr.isBattleServer
  local defaultMotion = "motion_stander"
  local partnerTriggerConditionList = {
    [TRIGGER_CONDITION.PARTNER_DYING] = 1,
    [TRIGGER_CONDITION.PARTNER_HP_LOSS] = 1,
    [TRIGGER_CONDITION.PARTNER_RANGED_HP_LOSS] = 1,
    [TRIGGER_CONDITION.PARTNER_NO_SUMMON] = 1,
    [TRIGGER_CONDITION.PARTNER_SUMMON_LESS_EQUAL] = 1,
    [TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543] = 1
  }
  local enemyTriggerConditionList = {
    [TRIGGER_CONDITION.ENEMY_DEAD] = 1
  }
  
  function unit:Init()
    self:InitBaseData()
    if data.isGrid then
      self.isGrid = true
    end
    self:InitData(data)
    self:InitCoverRadius()
    if self.isGrid then
      local x, y, z = BattleScene.GetInitPosition(self.positionIndex)
      self:SavePosition(x, y, z)
      if true ~= BattleMgr.isBattleServer then
        self:CreateModel()
        self:SetPosition(true)
      end
      return
    elseif 0 ~= self.positionIndex then
      local x, y, z = BattleScene.GetInitPosition(self.positionIndex, self.coverRadiusR and self.coverRadiusR * 2 or self.coverRadiusHalfW * 2, self.coverRadiusR and self.coverRadiusR * 2 or self.coverRadiusHalfH * 2)
      self:SavePosition(x, y, z)
      if self.id == SPECIAL_CARD_OR_MONSTER.HEI_YU then
        self.oriPosition = {
          x = self.position.x,
          y = self.position.y,
          z = self.position.z
        }
      end
    end
    if self.buildingType ~= BATTLE_BUILDING_TYPE.TRAP_PERSIST and self.buildingType ~= BATTLE_BUILDING_TYPE.TRAP_TRIGGER and self.buildingType ~= BATTLE_BUILDING_TYPE.SUMMON then
      self:UpdatePathIndex()
    end
    self.cachedDistance[self.uid] = 0
    BattleScene.UpdateCacheDistance(self)
    if true ~= BattleMgr.isBattleServer then
      self:CreateModel()
      self:SetPosition(true)
    end
    self:UpdateActionSpeed()
    self:UpdateMoveSpeed()
    local BattleAction = BattleAction
    local BattleActionDisplay = BattleActionDisplay
    self:AddStateAction(BATTLE_STATE_ENUM.START, BattleAction.DealStart, BattleActionDisplay.PlayStart)
    self:AddStateAction(BATTLE_STATE_ENUM.STAND, BattleAction.DealStand, BattleActionDisplay.PlayStand)
    self:AddStateAction(BATTLE_STATE_ENUM.MOVE, BattleAction.DealMove, BattleActionDisplay.PlayMove)
    self:AddStateAction(BATTLE_STATE_ENUM.WAIT_ATTACK, BattleAction.DealWaitAttack, BattleActionDisplay.PlayWaitAttack)
    self:AddStateAction(BATTLE_STATE_ENUM.ATTACK, BattleAction.DealAttack, BattleActionDisplay.PlayAttack)
    self:AddStateAction(BATTLE_STATE_ENUM.ATTACK_OVER, BattleAction.DealAttackOver)
    self:AddStateAction(BATTLE_STATE_ENUM.DEAD, BattleAction.DealDead, BattleActionDisplay.PlayDead)
    self:AddStateAction(BATTLE_STATE_ENUM.REVIVE, BattleAction.DealRevive, BattleActionDisplay.PlayRevive)
    self:AddStateAction(BATTLE_STATE_ENUM.DESTROY, nil, BattleActionDisplay.PlayDestroy)
    self:AddStateAction(BATTLE_STATE_ENUM.PERSIST_CAST, nil, BattleActionDisplay.PlayPersistCast)
    self:AddStateAction(BATTLE_STATE_ENUM.STUN, nil, BattleActionDisplay.PlayStun)
    self:AddStateAction(BATTLE_STATE_ENUM.BEAT_BACK, BattleAction.DealBeatBack, BattleActionDisplay.PlayBeatBack)
    self:AddStateAction(BATTLE_STATE_ENUM.DEVOUR, BattleAction.DealDevour, BattleActionDisplay.PlayDevour)
    self:AddStateAction(BATTLE_STATE_ENUM.FEAR, BattleAction.DealFear, BattleActionDisplay.PlayFear)
    self:AddStateAction(BATTLE_STATE_ENUM.SPECIAL, BattleAction.DealSpecial, BattleActionDisplay.PlaySpecial)
    if data.state then
      self:SetState(data.state)
    end
  end
  
  function unit:InitBaseData(transformReset, keepSkillIndex)
    if true ~= transformReset then
      self.positionIndex = 0
      self.positionIndexX = 0
      self.positionIndexY = 0
      self.originId = nil
      self.curPathIndexX = nil
      self.curPathIndexY = nil
      self.position = {
        x = 0,
        y = 0,
        z = 0
      }
      self.oriPosition = {
        x = 0,
        y = 0,
        z = 0
      }
      self.sortingOrder = nil
      self.fixedSortingOrder = nil
      self.curMove = 0
      self.totalMove = 0
      self.curHurt = 0
      self.totalHurt = 0
      self.totalShieldGot = 0
      self.tenacityMax = 0
      self.shieldSpecialMax = 0
      self.lastHpPer = nil
      self.tempHpPer = nil
      self.states = {}
      self.model = nil
      self.noDisplay = false
      self.mixSkeleton = false
      self.skeletonModelList = {}
      self.modelAnimationList = nil
      self.pointObjectList = {}
      self.savedFlip = nil
      self.lightEnable = nil
      self.shadowEnable = nil
      self.outlineEnable = nil
      self.tempBuffListForTrans = nil
      self.buffUidList = {}
      self.cachedBuffAttr = {}
      self.buffRefreshCurFrame = nil
      self.cachedBuffEffect = {}
      self.cachedBuffControlType = {}
      self.cachedBuffEffectTag = {}
      self.savedHurtDisplayList = {}
      self.savedRageDisplayList = {}
      self.savedBuffWordsDisplayList = {}
      self.savedBuffEffectDisplayList = {}
      self.savedTriggerSkillList = {}
      self.isStun = false
      self.isFreeze = false
      self.isStealth = false
      self.isTimePause = false
      self.isPetrified = false
      self.isSilent = false
      self.isPause = false
      self.isCharm = false
      self.isDefense = false
      self.isBlind = false
      self.isFear = false
      self.isPersistCast = false
      self.isTrick = false
      self.unableToSelect = false
      self.beAttractedUid = nil
      self.delayCancelBeAttractTargetUid = nil
      self.charmUid = nil
      self.smallSkillTriggerMaxChange = 0
      self.normalSkillDamage = 0
      self.normalSkillDamageOutBurst = 0
      self.normalSkillDamageInBurst = 0
      self.smallSkillDamage = 0
      self.uniqueSkillDamage = 0
      self.burstSkillDamage = 0
      self.buffDamage = 0
      self.summonDamage = 0
      self.damageRecord = 0
      self.damagedRecord = 0
      self.treatRecord = 0
      self.treatedRecord = 0
      self.treatedFromOther = 0
      self.UIPosition = nil
      self.monsterIdHistory = {}
      self.messageBar = nil
      self.treatedTemp_1 = 0
      self.realTimeAttrList = {}
      self.chargeValue = nil
      self.chargeRatio = nil
      self.maxChargeHpRatio = nil
      self.maxChargeConfigValue = nil
      self.maxChargeValue = nil
    end
    self.specialStateRemainFrames = nil
    self.dealSpecialStateDisplay = nil
    self.specialStateDelayMaxFrames = 150
    self.specialStateDelayFrames = nil
    self.specialStateEndFrame = nil
    self.displayPosition = {
      x = 10000,
      y = 10000,
      z = 10000
    }
    self.isFlip = false
    self.speed = {
      x = 0,
      y = 0,
      z = 0
    }
    self.weight = nil
    self.beatBackPerFrame = {
      x = 0,
      y = 0,
      z = 0
    }
    self.coverRadius = nil
    self.coverRadiusR = nil
    self.coverRadiusHalfW = nil
    self.coverRadiusHalfH = nil
    self.cachedDistance = {}
    self.moveTargetUid = nil
    self.attackTargetUid = nil
    self.lastAttackTargetUid = nil
    self.skillTargetUidList = {}
    self.lastKillSelfUnitUid = nil
    self.lastDamageSelfUnitUid = nil
    self.needDestroy = nil
    self.canTriggerSelfDyingSkill = true
    self.cachedSkillShowDisplayInfos = {}
    self.curSkillShowDisplayConfig = nil
    self.defaultAttackSpeed = 10000
    self.attackFrameScale = 10000
    self.defaultModelScale = 10000
    self.modelTimeScale = 1
    self.savedModelTimeScale = 1
    self.defaultStartInterval = nil
    self.defaultNormalSkillTotalFrame = nil
    self.defaultNormalSkillInterval = nil
    self.curStartInterval = nil
    self.curNormalSkillTotalFrame = nil
    self.curNormalSkillInterval = nil
    self.curState = nil
    self.preState = nil
    self.burstEffect = nil
    self.effectModel = nil
    self.effectModelList = nil
    self.spineState = nil
    self.alpha = 1
    self.skillEffectList = {}
    self.otherEffectList = {}
    self.badgeSuitBuffList = {}
    self.isDisplayDestroyed = false
    self.curSkill = {
      id = nil,
      type = nil,
      isTrigger = nil,
      targetInfo = {}
    }
    self.curSkillFrame = nil
    self.attackPointList = nil
    self.attackSoundList = nil
    self.attackVoiceList = nil
    self.attackSoundTargetList = nil
    self.attackWarningEffectList = nil
    self.oriSkillList = nil
    self.loopSkillList = nil
    if true ~= keepSkillIndex then
      self.curSkillIndex = nil
    end
    self.burstSkill = nil
    self.burstSkillWaitFrame = 0
    self.burstSkillCD = nil
    self.waitAttackFrame = 0
    self.hideMessageBarTime = nil
    self.firstAttackFrame = nil
    self.waitFrameDying = nil
    self.skillWhenDying = nil
    self.chooseTargetWaitFrame = 0
    self.defaultChooseTargetWaitFrame = 0
    self.id = nil
    self.uid = nil
    self.name = nil
    self.fashionId = nil
    self.battleUnitType = nil
    self.elementTypes = nil
    self.isGrid = false
    self.isMonster = false
    self.monsterRank = -1
    self.isBuilding = false
    self.buildingType = nil
    self.fashionScale = 1
    self.isSupportOrRanged = false
    self.canMoveOrAttack = true
    self.showBossMessage = false
    self.showHeadInList = false
    self.haveRage = false
    self.triggerTrapUid = nil
    self.camp = nil
    self.enemyCamp = nil
    self.level = nil
    self.grade = nil
    self.star = nil
    self.skill2Level = {}
    self.passiveSkillLevel = {}
    self.passiveSkillTriggerTable = {}
    self.otherSkillTriggerTable = {}
    self.skillIdList = {}
    self.leaderSkillLevelUpConfig = nil
    self.attrMap = {}
    self.blockMax = nil
    self.blockList = {}
    self.rangeFind = nil
    self.savedAtkSpeed = nil
    self.saveMoveSpeed = nil
    self.savedSmallSkillList = {}
    self.baseConfig = nil
    self.baseCardOrMonsterConfig = nil
    self.jobConfig = nil
    self.gradeUpConfig = nil
    self.fashionConfig = nil
    self.fashionBubbleConfig = nil
    self.startWaitFrame = nil
    self.defaultWaitFrame = nil
    self.normalSkillId = nil
    self.normalSkillShowConfig = nil
    self.savedSkillLevelUpConfig = {}
    self.savedSubSkillConfig = {}
    self.savedSkillShowConfig = {}
    self.savedSkillShowId = {}
    self.savedSkillShowDisplayAttackList = {}
    self.savedAttackSoundList = {}
    self.savedAttackVoiceList = {}
    self.savedAttackSoundTargetList = {}
    self.savedWarningEffectList = {}
    self.isDead = false
    self.canDestroy = true
    self.summonId = nil
    self.calculateUseSummonFrom = nil
    self.remainTime = nil
    self.summonFromUnit = nil
    self.cachedSummonUids = {}
    self.invisibleInAxis = nil
    self.extraUniqueSkillDamageRate = nil
    self.extraBurstSkillDamageRate = nil
    self.deadTime = nil
    self.tempRangeAtk = nil
    self.displayDissolve = nil
    self.cachedDisplayHurtTips = {}
    self.moveToPosition = nil
    self.invalidUpdate = false
    self.preloadEffect = {}
    self.preloadBank = {}
    self.curMotion = nil
    self.motionStateList = {}
    self.curTargetCount = nil
    self.tempSort = nil
    self.tempSortDis = nil
    self.tempSortDisZ = nil
    self.fearTargetPosition = nil
    self.fearStartPosition = nil
  end
  
  function unit:InitData(dataParam)
    if dataParam.isGrid == true then
      self.uid = dataParam.uid
      self.positionIndex = dataParam.positionIndex
      self.positionIndexX = dataParam.positionIndexX
      self.positionIndexY = dataParam.positionIndexY
      return
    end
    if dataParam.uid == nil or dataParam.uid == "" or 0 == dataParam.uid then
      self.uid = BattleScene.GetUnitGlobalIndex()
      if dataParam.summonId then
        self.uid = self.uid + 100000
      end
    else
      self.uid = dataParam.uid
    end
    local summonConfig
    if dataParam.summonId then
      self.summonId = dataParam.summonId
      summonConfig = TableData.GetConfig(self.summonId, "BaseSkillSummon")
      self.calculateUseSummonFrom = summonConfig.calculate_use_summon_from
      self.invisibleInAxis = summonConfig.invisible_in_axis
      self.remainTime = summonConfig.destroy_time * BATTLE_CONFIG_ENUM.FIXED_FPS
      local summonFromUnit = dataParam.summonFromUnit
      if summonFromUnit then
        local summonUnit = BattleScene.GetUnitByUid(summonFromUnit)
        summonUnit:AddSummonUid(self.uid)
        if summonConfig.building_with_fashion then
          for i, v in ipairs(summonConfig.building_with_fashion) do
            local strs = Split(v, ":")
            if strs[1] == tostring(summonUnit.fashionId) then
              self.id = tonumber(strs[2])
              break
            end
          end
        elseif summonConfig.building_id then
          self.id = summonConfig.building_id
        end
        if summonConfig.monster_with_fashion then
          for i, v in ipairs(summonConfig.monster_with_fashion) do
            local strs = Split(v, ":")
            if strs[1] == tostring(summonUnit.fashionId) then
              self.id = tonumber(strs[2])
              break
            end
          end
        elseif summonConfig.monster_id then
          self.id = summonConfig.monster_id
        end
      elseif summonConfig.building_id then
        self.id = summonConfig.building_id
      else
        self.id = summonConfig.monster_id
      end
      self.summonFromUnit = summonFromUnit
    else
      self.id = dataParam.id
    end
    if nil == self.originId then
      self.originId = self.id
    end
    local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
    if cardOrMonsterConfig then
      if dataParam.fashionId and dataParam.fashionId > 0 then
        self.fashionId = dataParam.fashionId
      else
        self.fashionId = cardOrMonsterConfig.fashion_id
      end
      self.battleUnitType = cardOrMonsterConfig.type
      self.isSupportOrRanged = self.battleUnitType == BATTLE_UNIT_TYPE.SUPPORT or self.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK
      self.elementTypes = cardOrMonsterConfig.element_type or {}
      self.rangeFind = cardOrMonsterConfig.range_find or self:GetJobConfig().range_find
      self.haveRage = 1 ~= cardOrMonsterConfig.no_rage
      self.haveHp = 1 ~= cardOrMonsterConfig.no_hp
      self.showBossMessage = true ~= BattleMgr.isBattleServer and 1 == cardOrMonsterConfig.boss_show
      self:InitRestraint(cardOrMonsterConfig)
      self.weight = cardOrMonsterConfig.weight
      local burstSkill = cardOrMonsterConfig.burst_skill
      if burstSkill then
        self.burstSkill = burstSkill
        local burstSkillConfig = TableData.GetConfig(burstSkill, "BaseSkill")
        self.burstSkillCD = burstSkillConfig.cd * BATTLE_CONFIG_ENUM.FIXED_FPS
        if burstSkillConfig.default_cd then
          self.burstSkillWaitFrame = burstSkillConfig.default_cd * BATTLE_CONFIG_ENUM.FIXED_FPS
        else
          self.burstSkillWaitFrame = 0
        end
      end
      local transform = cardOrMonsterConfig.transform
      if transform then
        for index, str in ipairs(transform) do
          str = Split(str, ":")
          local sound
          if str[6] and "" ~= str[6] then
            sound = tonumber(str[6])
          end
          local transformWait = {
            unitUid = self.uid,
            conditionType = tonumber(str[1]),
            conditionValue = tonumber(str[2]),
            transformTo = tonumber(str[3]),
            transformEffect = str[4],
            transformKeepSkillIndex = "1" == str[5],
            sound = sound
          }
          BattleTransform.AddTransform(transformWait)
        end
      end
    end
    if self.isBuilding then
      local fashionId = self.baseConfig.fashion_id
      if fashionId then
        self.fashionId = fashionId
      end
    end
    if self.isMonster then
      table.insert(self.monsterIdHistory, self.id)
    end
    if 0 == self.fashionId then
      self.fashionId = nil
    end
    self.positionIndex = data.pos or 0
    if self.positionIndex > 0 then
      self.positionIndexX = math.floor(self.positionIndex / 100)
      self.positionIndexY = self.positionIndex % 100
    end
    self.camp = data.camp
    if self.camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
    elseif self.camp == BATTLE_CAMP_FLAG.RIGHT then
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
    else
      self.enemyCamp = nil
    end
    self.deadTime = -1
    self:SetModelFlip(self.camp == BATTLE_CAMP_FLAG.RIGHT)
    local mapConfig = TableData.GetConfig(BattleScene.GetMapId(), "BaseMap")
    if self.rangeFind and self.rangeFind > 0 then
      if self.camp == BATTLE_CAMP_FLAG.LEFT then
        self.rangeFind = self.rangeFind + math.max(mapConfig.size_own[1] - self.positionIndexX, 0) * 80
      elseif self.camp == BATTLE_CAMP_FLAG.RIGHT then
        self.rangeFind = self.rangeFind + math.max(self.positionIndexX - (mapConfig.size[1] - mapConfig.size_enemy[1] + 1), 0) * 80
      end
    end
    if true == self.isBuilding and self.buildingType ~= BATTLE_BUILDING_TYPE.ATTACK then
      self.canMoveOrAttack = false
    else
      self.canMoveOrAttack = true
    end
    if dataParam.position then
      local position = dataParam.position
      self.position = {
        x = MathUtil.TruncateFloat(position.x, 6),
        y = MathUtil.TruncateFloat(position.y, 6),
        z = MathUtil.TruncateFloat(position.z, 6)
      }
    end
    self.skillIdList = {}
    self:InitSkillList()
    local dealPassiveSkill = function(passive_skill)
      local levelUpConfig, triggerCondition_1, triggerCondition_2, skillId, level
      for i = 1, #passive_skill do
        skillId = passive_skill[i]
        level = self.skill2Level[skillId] or 1
        self.passiveSkillLevel[skillId] = level
        levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        triggerCondition_1 = levelUpConfig.trigger_condition_1
        self:SaveSkillTrigger(skillId, triggerCondition_1, level, true, BATTLE_SKILL_ENUM.PASSIVE)
        triggerCondition_2 = levelUpConfig.trigger_condition_2
        if triggerCondition_2 then
          self:SaveSkillTrigger(skillId, triggerCondition_2, level, true, BATTLE_SKILL_ENUM.PASSIVE)
        end
      end
    end
    self.skill2Level = {}
    self.savedSmallSkillList = {}
    local isClient = BattleMgr.isBattleServer == false
    if true == self.isMonster or true == self.isBuilding and cardOrMonsterConfig then
      self.grade = cardOrMonsterConfig.grade
      self.star = cardOrMonsterConfig.star
      self.level = cardOrMonsterConfig.level
      self.quality = cardOrMonsterConfig.quality
      local levelUpConfig, triggerCondition_1, triggerCondition_2
      if summonConfig and self.summonFromUnit then
        local fromUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
        if fromUnit then
          local inheritance_skill_level_summon = summonConfig.inheritance_skill_level_summon
          if inheritance_skill_level_summon then
            for _, skills in ipairs(inheritance_skill_level_summon) do
              local skillIds = Split(skills, ":")
              local skillIdInher = tonumber(skillIds[2])
              self.skill2Level[tonumber(skillIds[1])] = fromUnit:GetSkillLevel(skillIdInher)
            end
          end
        end
      end
      local passive_skill = self.baseConfig.passive_skill or {}
      dealPassiveSkill(passive_skill)
      local otherSkillList = {}
      local ex_skill = cardOrMonsterConfig.ex_skill
      local unique_skill = cardOrMonsterConfig.unique_skill
      local special_skill = cardOrMonsterConfig.special_skill
      if ex_skill and type(ex_skill) == "table" then
        for i = 1, #ex_skill do
          otherSkillList[#otherSkillList + 1] = ex_skill[i]
        end
      end
      if unique_skill and type(unique_skill) == "table" then
        for i = 1, #unique_skill do
          otherSkillList[#otherSkillList + 1] = unique_skill[i]
        end
      end
      if special_skill and type(special_skill) == "table" then
        for i = 1, #special_skill do
          otherSkillList[#otherSkillList + 1] = special_skill[i]
          table.insert(self.savedSmallSkillList, special_skill[i])
        end
      end
      for i = 1, #otherSkillList do
        local skillId = otherSkillList[i]
        local level = self.skill2Level[skillId] or 1
        levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        triggerCondition_1 = levelUpConfig.trigger_condition_1
        local tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
        local tempSkillType = tempSkillConfig.type
        self:SaveSkillTrigger(skillId, triggerCondition_1, level, false, tempSkillType)
        triggerCondition_2 = levelUpConfig.trigger_condition_2
        if triggerCondition_2 then
          self:SaveSkillTrigger(skillId, triggerCondition_2, level, false, tempSkillType)
        end
        if true == isClient then
          local showConfig = self:GetSkillShowConfig(skillId)
          if showConfig then
            local display_ids = showConfig.display_ids
            if display_ids and #display_ids > 0 then
              local displayConfig
              for i, displayId in ipairs(display_ids) do
                displayConfig = TableData.GetConfig(displayId, "BaseSkillShowDisplay")
                if displayConfig then
                  local name = {
                    "bullet_effect",
                    "effect",
                    "effect_target",
                    "hit_effect",
                    "effect_line",
                    "bullet_hit_effect",
                    "prepare_effect",
                    "remote_effect"
                  }
                  for _, str in ipairs(name) do
                    if displayConfig[str] then
                      if "remote_effect" == str then
                        local path = Split(displayConfig[str], ":")[2]
                        table.insert(self.preloadEffect, EffectUtil.GetFullPath(path))
                      else
                        table.insert(self.preloadEffect, EffectUtil.GetFullPath(displayConfig[str]))
                      end
                    end
                  end
                  local sound = displayConfig.sound
                  if sound and #sound > 0 then
                    local id = sound[1]
                    local soundConfig = TableData.GetConfig(id, "BaseSoundPath")
                    if soundConfig and false == table.contain(self.preloadBank, soundConfig.bank) then
                      table.insert(self.preloadBank, soundConfig.bank)
                    end
                  end
                end
              end
            end
          end
          local fashionBubbleConfig = self:GetFashionBubbleConfig()
          if fashionBubbleConfig then
            local ids = fashionBubbleConfig.attack_bubble_ids
            if ids and #ids > 0 then
              local id = ids[1]
              if id then
                local config = TableData.GetConfig(id, "BaseCardSound")
                if config and false == table.contain(self.preloadBank, config.bank) then
                  table.insert(self.preloadBank, config.bank)
                end
              end
            end
          end
        end
      end
    else
      if true == self.isBuilding then
        local passive_skill = self.baseConfig.passive_skill or {}
        dealPassiveSkill(passive_skill)
        return
      end
      self.grade = dataParam.grade
      self.star = dataParam.star
      self.quality = dataParam.quality
      local skill2Level = dataParam.skill2Level
      local skillLevels = dataParam.skillLevels
      if skillLevels and #skillLevels > 0 then
        skill2Level = {}
        for _, skillLevel in ipairs(skillLevels) do
          skill2Level[skillLevel.skillId] = skillLevel.level
        end
        dataParam.skill2Level = skill2Level
      end
      if skill2Level then
        local function dealCardSkill(skillId, level)
          local tempSkillConfig, levelUpConfig, triggerCondition_1, triggerCondition_2
          
          tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
          local tempSkillType = tempSkillConfig.type
          if tempSkillType == BATTLE_SKILL_ENUM.PASSIVE then
            self.passiveSkillLevel[skillId] = level
            levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
            triggerCondition_1 = levelUpConfig.trigger_condition_1
            self:SaveSkillTrigger(skillId, triggerCondition_1, level, true, tempSkillType)
            triggerCondition_2 = levelUpConfig.trigger_condition_2
            if triggerCondition_2 then
              self:SaveSkillTrigger(skillId, triggerCondition_2, level, true, tempSkillType)
            end
          elseif tempSkillType == BATTLE_SKILL_ENUM.LEADER then
            if self.camp == BATTLE_CAMP_FLAG.LEFT and self.id == BattleData.leaderCardIdLeft or self.camp == BATTLE_CAMP_FLAG.RIGHT and self.id == BattleData.leaderCardIdRight then
              self.passiveSkillLevel[skillId] = level
              levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
              triggerCondition_1 = levelUpConfig.trigger_condition_1
              self:SaveSkillTrigger(skillId, triggerCondition_1, level, true, tempSkillType)
              triggerCondition_2 = levelUpConfig.trigger_condition_2
              if triggerCondition_2 then
                self:SaveSkillTrigger(skillId, triggerCondition_2, level, true, tempSkillType)
              end
            end
          else
            if tempSkillType == BATTLE_SKILL_ENUM.SMALL then
              table.insert(self.savedSmallSkillList, skillId)
            end
            levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
            triggerCondition_1 = levelUpConfig.trigger_condition_1
            triggerCondition_2 = levelUpConfig.trigger_condition_2
            self:SaveSkillTrigger(skillId, triggerCondition_1, level, false, tempSkillType)
            if triggerCondition_2 then
              self:SaveSkillTrigger(skillId, triggerCondition_2, level, false, tempSkillType)
            end
            if levelUpConfig.extra_skill then
              local id = floor(levelUpConfig.extra_skill / 1000)
              local lv = levelUpConfig.extra_skill % 1000
              dealCardSkill(id, lv)
            end
            if levelUpConfig.extra_skill_2 then
              local id = floor(levelUpConfig.extra_skill_2 / 1000)
              local lv = levelUpConfig.extra_skill_2 % 1000
              dealCardSkill(id, lv)
            end
            if levelUpConfig.extra_skill_3 then
              local id = floor(levelUpConfig.extra_skill_3 / 1000)
              local lv = levelUpConfig.extra_skill_3 % 1000
              dealCardSkill(id, lv)
            end
            if true == isClient then
              local showConfig = self:GetSkillShowConfig(skillId)
              if showConfig then
                local display_ids = showConfig.display_ids
                if display_ids and #display_ids > 0 then
                  local displayConfig
                  for i, displayId in ipairs(display_ids) do
                    displayConfig = TableData.GetConfig(displayId, "BaseSkillShowDisplay")
                    if displayConfig then
                      local name = {
                        "bullet_effect",
                        "effect",
                        "effect_target",
                        "hit_effect",
                        "effect_line",
                        "hit_effect",
                        "bullet_hit_effect"
                      }
                      for _, str in ipairs(name) do
                        if displayConfig[str] then
                          table.insert(self.preloadEffect, EffectUtil.GetFullPath(displayConfig[str]))
                        end
                      end
                      local sound = displayConfig.sound
                      if sound and #sound > 0 then
                        local id = sound[1]
                        local soundConfig = TableData.GetConfig(id, "BaseSoundPath")
                        if soundConfig and table.contain(self.preloadBank, soundConfig.bank) == false then
                          table.insert(self.preloadBank, soundConfig.bank)
                        end
                      end
                    end
                  end
                end
              end
              local fashionBubbleConfig = self:GetFashionBubbleConfig()
              if fashionBubbleConfig then
                local ids = fashionBubbleConfig.attack_bubble_ids
                if ids and #ids > 0 then
                  local id = ids[1]
                  if id then
                    local config = TableData.GetConfig(id, "BaseCardSound")
                    if config and table.contain(self.preloadBank, config.bank) == false then
                      table.insert(self.preloadBank, config.bank)
                    end
                  end
                end
              end
            end
          end
        end
        
        for skillId, level in pairs(skill2Level) do
          dealCardSkill(skillId, level)
        end
        self.skill2Level = skill2Level
      end
    end
    local attributes
    if dataParam.summonId then
      attributes = CardData.CalculatorCardAttr(self)
      self:InitAttrMap(attributes)
      self:InitAttrMapMonsterConfig(cardOrMonsterConfig, summonConfig, dataParam.buffParams)
    else
      if self.camp == BATTLE_CAMP_FLAG.RIGHT then
        if BattleData.stageType == ProtoEnum.SCENE_TYPE.ROGUE then
          attributes = CardData.CalculatorCardAttr(dataParam, {
            rogueData = BattleData.rogueData,
            stageId = BattleData.stageId
          })
        elseif BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
          attributes = CardData.CalculatorCardAttr(dataParam)
        else
          attributes = CardData.CalculatorCardAttr(dataParam)
        end
      elseif BattleData.stageType == ProtoEnum.SCENE_TYPE.ROGUE then
        attributes = CardData.CalculatorCardAttr(dataParam, {
          rogueData = BattleData.rogueData,
          stageId = BattleData.stageId
        })
      else
        attributes = CardData.CalculatorCardAttr(dataParam)
      end
      self:InitAttrMap(attributes)
    end
    if self.isBuilding == false and dataParam.maxHp and dataParam.hp then
      local maxHp = self:GetAttr(ATTR_ENUM.max_hp)
      local hpData, maxHpData = dataParam.hp, dataParam.maxHp
      if 0 == maxHpData then
        maxHpData = maxHp
      end
      local changeValue = MathUtil.TruncateFloat((maxHp - maxHpData) * hpData / maxHpData)
      self:SetAttr(ATTR_ENUM.hp, hpData + ceil(changeValue))
    elseif nil == dataParam.maxHp and dataParam.hp then
      local hp = math.min(dataParam.hp, self:GetAttr(ATTR_ENUM.max_hp))
      self:SetInitAttr(ATTR_ENUM.hp, hp)
    else
      self:SetInitAttr(ATTR_ENUM.hp, self:GetAttr(ATTR_ENUM.max_hp))
    end
    if self.haveRage and dataParam.rage and dataParam.rage > 0 then
      local rage = math.min(dataParam.rage, self:GetAttr(ATTR_ENUM.max_rage))
      self:SetInitAttr(ATTR_ENUM.rage, rage)
    end
    self:UpdateTempHpPer()
    self.tempRangeAtk = self:GetAttr(ATTR_ENUM.range_atk)
    if dataParam.badgeSuitIds then
      local suitConfig, buffList
      for _, suitId in ipairs(dataParam.badgeSuitIds) do
        suitConfig = TableData.GetConfig(suitId, "BaseBadgeSuit")
        buffList = suitConfig.buff_list
        if buffList then
          for _, buffId in ipairs(buffList) do
            table.insert(self.badgeSuitBuffList, buffId)
          end
        end
      end
    end
    if self.id == SPECIAL_CARD_OR_MONSTER.GUI_SHI then
      self.chargeValue = 0
      local campObject = BattleScene.GetCampObject(self.camp)
      if campObject then
        campObject:AddCanChargeUnit(self)
      end
    end
  end
  
  function unit:GetChargeMax()
    if self.chargeRatio == nil or 0 == self.chargeRatio then
      self.chargeRatio = self:GetEffectTotalValue(BUFF_EFFECT_ID.HURT_EXCHANGE_CHARGE_RATIO)
    end
    if nil == self.maxChargeHpRatio or 0 == self.maxChargeHpRatio then
      self.maxChargeHpRatio = self:GetEffectTotalValue(BUFF_EFFECT_ID.MAX_CHARGE_HP_RATIO)
    end
    if nil == self.maxChargeConfigValue or 0 == self.maxChargeConfigValue then
      self.maxChargeConfigValue = self:GetEffectTotalValue(BUFF_EFFECT_ID.MAX_CHARGE_VALUE)
    end
    return self.maxChargeHpRatio + self.maxChargeConfigValue
  end
  
  function unit:IsSummonAlive()
    local uids = self.cachedSummonUids
    if uids and #uids > 0 then
      for _, uid in ipairs(uids) do
        local summonUnit = BattleScene.GetUnitByUid(uid)
        if summonUnit and summonUnit:IsAlive() and summonUnit:GetHp() > 0 then
          return true
        end
      end
    end
    return false
  end
  
  function unit:AddSummonUid(uid)
    table.insert(self.cachedSummonUids, uid)
    self:UpdateSkin()
  end
  
  function unit:RemoveSummonUid(uid)
    local uids = self.cachedSummonUids
    for i, v in ipairs(uids) do
      if v == uid then
        table.remove(self.cachedSummonUids, i)
      end
    end
    self:UpdateSkin()
  end
  
  function unit:UpdateSkin()
    if self.isMonster == true or self.fashionConfig == nil or nil == self.model then
      return
    end
    SkeletonAnimationUtil.UpdateSkin(self.model, nil, nil, #self.cachedSummonUids > 0)
  end
  
  function unit:SetMotion(motion)
  end
  
  function unit:SaveCharge(hurt)
    if self.chargeValue and hurt > 0 then
      local max = self:GetChargeMax()
      self.chargeValue = math.ceil(self.chargeValue + hurt * self.chargeRatio / 10000)
      self.chargeValue = math.min(max, self.chargeValue)
      self.maxChargeValue = max
    end
  end
  
  function unit:ClearCharge()
    if self.chargeValue then
      self.chargeValue = 0
    end
  end
  
  function unit:SaveSkillTrigger(skillId, triggerCondition, level, isPassive, skillType)
    self.skillIdList[skillId] = 1
    if triggerCondition then
      local list
      if true == isPassive then
        list = self.passiveSkillTriggerTable
      else
        list = self.otherSkillTriggerTable
      end
      for i = 1, #triggerCondition do
        local condition = triggerCondition[i]
        local isCached = false
        local t = list[condition]
        if nil == t then
          t = {}
        else
          for j = 1, #t do
            if t[j].skillId == skillId then
              isCached = true
              break
            end
          end
        end
        if isCached then
          break
        end
        t[#t + 1] = {
          skillId = skillId,
          skillType = skillType,
          level = level,
          enable = true
        }
        if skillType then
          table.sort(t, function(a, b)
            if a.skillType == b.skillType then
              return a.skillId < b.skillId
            end
            return a.skillType > b.skillType
          end)
        end
        if 1 == partnerTriggerConditionList[condition] then
          BattleScene.AddPartnerTrigger(self, condition, skillId)
        elseif 1 == enemyTriggerConditionList[condition] then
          BattleScene.AddEnemyTrigger(self, condition, skillId)
        end
        list[condition] = t
      end
    end
  end
  
  function unit:RemoveSkillTrigger(specificCondition, skillId)
    BattleScene.RemovePartnerTrigger(self, specificCondition, skillId)
    local list = self.passiveSkillTriggerTable[specificCondition]
    if list then
      local v
      for i = 1, #list do
        v = list[i]
        if v.skillId == skillId then
          v.enable = false
          return
        end
      end
    end
    list = self.otherSkillTriggerTable[specificCondition]
    if list then
      local v
      for i = 1, #list do
        v = list[i]
        if v.skillId == skillId then
          v.enable = false
          return
        end
      end
    end
  end
  
  function unit:CreateModel()
    if self.isGrid then
      if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
        if self.positionIndexX <= BattleScene.GetLeftCampXCount() then
          self.model = ResourceManager.Instantiate("Assets/Art/Test/green.prefab")
        elseif self.positionIndexX > BattleScene.GetMapXCount() - BattleScene.GetRightCampXCount() then
          self.model = ResourceManager.Instantiate("Assets/Art/Test/red.prefab")
        else
          self.model = ResourceManager.Instantiate("Assets/Art/Test/black.prefab")
        end
        self.model.name = string.format("格子_%s_%s", self.positionIndexX, self.positionIndexY)
      else
        self.model = ResourceManager.Instantiate("Assets/Art/Test/empty.prefab")
      end
      local scale = 5
      BattleResourceManager:AddGameObject(self.model, self.position.x, self.position.y, self.position.z, scale, scale, scale)
      LuaUtil.SetLocalEuler(self.model, BATTLE_CONFIG_ENUM.BACKGROUND_ROTATION_X, 0, 0)
      return
    end
    local effect = self.baseConfig.effect
    local singleEffect = self.baseConfig.single_effect
    if effect or singleEffect then
      if self.coverRadiusHalfW and self.coverRadiusHalfH then
        local ceilLength = BattleScene.ceilLength
        local pixelsPerUnit = BattleScene.pixelsPerUnit
        local countX = self.coverRadiusHalfW * 2 / ceilLength
        local countY = self.coverRadiusHalfH * 2 / ceilLength
        if countX > 1 or countY > 1 then
          local position = self.position
          local startX = position.x - (countX / 2 - 0.5) * ceilLength / pixelsPerUnit
          local startZ = position.z - (countY / 2 - 0.5) * ceilLength / pixelsPerUnit
          if effect then
            self.effectModelList = {}
            for i = 1, countX do
              for j = 1, countY do
                ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(effect), function(model)
                  table.insert(self.effectModelList, model)
                  local scale = BATTLE_CONFIG_ENUM.CARD_SCALE
                  BattleResourceManager:AddGameObject(model, startX + (i - 1) * ceilLength / pixelsPerUnit, position.y, startZ + (j - 1) * ceilLength / pixelsPerUnit, scale, scale, scale)
                  if #self.effectModelList == countX * countY then
                    self:UpdateSortingOrder()
                  end
                end)
              end
            end
          elseif singleEffect then
            ResourceManager.InstantiateAsync(singleEffect, function(model)
              self.effectModel = model
              if self.haveHp then
                self.messageBar = BattleMessageBar.BindInfo(self)
              end
              local scale = BATTLE_CONFIG_ENUM.CARD_SCALE
              if self.isBuilding and self.baseConfig.scale then
                scale = scale * self.baseConfig.scale / 10000
              end
              BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
              self:SetPosition()
            end)
          end
          return
        end
      end
      ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(effect), function(model)
        self.effectModel = model
        if self.haveHp then
          self.messageBar = BattleMessageBar.BindInfo(self)
        end
        local scale = BATTLE_CONFIG_ENUM.CARD_SCALE
        if self.isBuilding and self.baseConfig.scale then
          scale = scale * self.baseConfig.scale / 10000
        end
        BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
        self:SetPosition()
      end)
      return
    end
    if self.fashionId == nil then
      local model = GameObject()
      LuaUtil.ChangeLayer(model.transform, "Default")
      model.name = self:GetName()
      local scale = 1
      BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
      self.model = model
      self.noDisplay = true
      return
    end
    local fashionConfig = self:GetFashionConfig()
    local model = ResourceManager.Instantiate(ModelUtil.GetFullPath(fashionConfig.spd))
    self.outlineEnable = false
    self.curMotion = defaultMotion
    if self.isBuilding then
      self.lightEnable = false
    else
      self.lightEnable = true
    end
    self.lightEnable = false
    if SkeletonAnimationUtil.GetSkeletonAnimation(model) then
      self.shadowEnable = true
      SkeletonAnimationUtil.BindBattleSpineHelper(model, self)
    else
      SkeletonAnimationUtil.BindBattleSpineHelper(model, self)
      self.mixSkeleton = true
      self.shadowEnable = false
      self.skeletonModelList = {}
      self.pointObjectList = {}
      local animations = model:GetComponentsInChildren(typeof(SkeletonAnimation), true)
      for i = 0, animations.Length - 1 do
        local animationGameObject = animations[i].gameObject
        table.insert(self.skeletonModelList, animationGameObject)
        local slots = animations[i].Skeleton.Slots
        if slots.Count > 0 then
          for slotIndex = 0, slots.Count - 1 do
            local slot = slots.Items[slotIndex]
            local slotName = slot.Data.AttachmentName
            if string.find(slotName, "bullet") or string.find(slotName, "hit") then
              SkeletonAnimationUtil.CreatePointFollower(animationGameObject.transform, slotName, slotName, slotName)
              self.pointObjectList[slotName] = animationGameObject.transform:Find(slotName)
            end
          end
        end
      end
    end
    SkeletonAnimationUtil.SetShaderEffectEnable(model, self.lightEnable, self.shadowEnable, self.outlineEnable)
    LuaUtil.ChangeLayer(model.transform, "Default")
    model.name = self:GetName()
    self.fashionScale = fashionConfig.spd_scale / 10000
    local scale = BATTLE_CONFIG_ENUM.CARD_SCALE * self.fashionScale
    BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
    self.model = model
    if self.camp == BATTLE_CAMP_FLAG.RIGHT then
      self:SetModelFlip(true)
      self:UpdateFlip()
    end
    if nil ~= self:GetBaseCardOrMonsterConfig() and self.haveHp then
      self.messageBar = BattleMessageBar.BindInfo(self)
    end
    self:SetModelFlip(self.camp == BATTLE_CAMP_FLAG.RIGHT)
    LuaUtil.SetLocalEuler(model, BATTLE_CONFIG_ENUM.CAMERA_ROTATION_X, 0, 0)
    if BattleData.curWaveIndex and BattleData.curWaveIndex > 1 then
      self.model:SetActiveSafe(false)
      if self.camp == BATTLE_CAMP_FLAG.LEFT then
        LeanTween.delayedCall(0.3 + self.positionIndexX * 0.1, function()
          self.model:SetActiveSafe(true)
          self:SetAnimation(0, SPINE_STATE_ENUM.IN, false, function()
            self:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
          end)
        end)
      else
        LeanTween.delayedCall(self.positionIndexX * 0.1, function()
          self.model:SetActiveSafe(true)
          self:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
          local path = "Assets/Art/Effects/Prefab/20312/FX_20312_summon.prefab"
          self:CreateEffect("change_wave_effect", path, true)
        end)
      end
    else
      self:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
    end
    if self.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_ENTER, self)
    end
    if self.summonId then
      local config = TableData.GetConfig(self.summonId, "BaseSkillSummon")
      local path
      if config.fashion_effect_paths and self.summonFromUnit then
        local fromUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
        for _, v in ipairs(config.fashion_effect_paths) do
          local strs = Split(v, ":")
          if strs[1] == tostring(fromUnit.fashionId) then
            path = strs[2]
            break
          end
        end
      end
      if nil == path then
        path = config.effect_path
      end
      if path then
        BattleActionDisplay.AddWaitDealEffect(nil, self, path, EffectUtil.GetFullPath(path), true)
      end
      if config.sound then
        local soundPathConfig = TableData.GetConfig(config.sound, "BaseSoundPath")
        if soundPathConfig then
          BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model or self.effectModel)
        end
      end
    end
  end
  
  function unit:SetAnimation(track, state, loop, onComplete, updateNow, mixDuration, timeScale, duration)
    if self.mixSkeleton then
      for i, model in ipairs(self.skeletonModelList) do
        if 1 == i then
          SkeletonAnimationUtil.SetAnimation(model, track, state, loop, onComplete, updateNow or false, mixDuration, timeScale or -1, duration or 0)
        else
          SkeletonAnimationUtil.SetAnimation(model, track, state, loop, nil, updateNow or false, mixDuration, timeScale or -1, duration or 0)
        end
      end
    else
      SkeletonAnimationUtil.SetAnimation(self.model, track, state, loop, onComplete, updateNow or false, mixDuration, timeScale or -1, duration or 0)
    end
  end
  
  function unit:AddAnimationEvent(func)
    if self.mixSkeleton then
      for _, model in ipairs(self.skeletonModelList) do
        SkeletonAnimationUtil.AddEvent(model, func)
      end
    else
      SkeletonAnimationUtil.AddEvent(self.model, func)
    end
  end
  
  function unit:RemoveAnimationEvent(func)
    if self.mixSkeleton then
      for _, model in ipairs(self.skeletonModelList) do
        SkeletonAnimationUtil.RemoveEvent(model, func)
      end
    else
      SkeletonAnimationUtil.RemoveEvent(self.model, func)
    end
  end
  
  function unit:ChangeModel(callback, transformEffect)
    if self.model then
      if transformEffect and "" ~= transformEffect then
        local effect = self:CreateEffect(transformEffect, EffectUtil.GetFullPath(transformEffect), true)
        if effect then
          effect:IgnoreTimeScale(true, true)
        end
      end
      self.model:IgnoreTimeScale(true)
      local changeFunc
      
      function changeFunc(track, event)
        if event.Data.Name == "change" then
          callback(self)
          self:RemoveAnimationEvent(changeFunc)
          local preModel = self:DestroyModelWhenTransform()
          self:CreateModel()
          self:SetPosition(true)
          BattleResourceManager:UpdateResourceBindObject(preModel, self.model)
        end
      end
      
      self:AddAnimationEvent(changeFunc)
      self:SetAnimation(0, SPINE_STATE_ENUM.CHANGE, false)
    else
      callback()
    end
  end
  
  function unit:ShowModelDead()
    if self.battleUnitType and self.isMonster == false and false == self.isBuilding then
      self.model = ResourceManager.Instantiate(BATTLE_RES_PATH.TOMBSTONE)
      self:CreateEffect("mubei_in_effect", BATTLE_RES_PATH.TOMBSTONE_IN_EFFECT, true)
      self.sortingOrder = nil
      local scale = 0.36
      BattleResourceManager:AddGameObject(self.model, 0, 0, 0, scale, scale, scale)
      LuaUtil.SetLocalEuler(self.model, BATTLE_CONFIG_ENUM.CAMERA_ROTATION_X, 0, 0)
      self:SetPosition()
      self:ChangeAnimation("in", false, function()
        self:ChangeAnimation("loop", true)
      end)
    end
  end
  
  function unit:UpdateFlip()
    if self.model and self.isFlip ~= self.savedFlip then
      self.isFlip = self.savedFlip
      SkeletonAnimationUtil.SetFlip(self.model, self.isFlip, false)
      self:UpdateBuffEffectFlip()
    end
  end
  
  function unit:UpdateBuffEffectFlip()
    local buffList = self.buffUidList
    for uid in pairs(buffList) do
      local buff = BattleBuffMgr.GetBuffByUid(uid)
      if buff and buff.effectLoop then
        local effectPath = buff.settleEffectPath
        if effectPath then
          self:UpdateEffectFlip(effectPath)
        end
      end
    end
  end
  
  function unit:SetModelFlip(isFlip)
    self.savedFlip = isFlip
  end
  
  function unit:CreateFearTargetPosition(radius)
    radius = radius or 100
    local r = radius / BattleScene.pixelsPerUnit
    local random = BattleData.GetRandomSeed()
    local random2 = math.max(BattleData.GetRandomSeed2(), 5000)
    local an = random * 360 / 10000
    local rand = math.rad(an)
    local x_off = math.cos(rand) * r * random2 / 10000
    local z_off = math.sin(rand) * r * random2 / 10000
    local startPosition = self.fearStartPosition
    if x_off * (self.position.x - startPosition.x) > 0 and z_off * (self.position.z - startPosition.z) > 0 then
      x_off = -x_off
      z_off = -z_off
    end
    self.fearTargetPosition = {
      x = MathUtil.TruncateFloatN(startPosition.x + x_off, 6, BattleData.isMirror),
      y = MathUtil.TruncateFloatN(startPosition.y, 6),
      z = MathUtil.TruncateFloatN(startPosition.z + z_off, 6)
    }
  end
  
  function unit:SavePosition(x, y, z)
    if BattleData.maxMoveX and self.camp == BATTLE_CAMP_FLAG.LEFT then
      self.position = {
        x = MathUtil.TruncateFloatN(math.min(BattleData.maxMoveX, x), 6, BattleData.isMirror),
        y = MathUtil.TruncateFloatN(y, 6),
        z = MathUtil.TruncateFloatN(z, 6)
      }
    else
      self.position = {
        x = MathUtil.TruncateFloatN(x, 6, BattleData.isMirror),
        y = MathUtil.TruncateFloatN(y, 6),
        z = MathUtil.TruncateFloatN(z, 6)
      }
    end
  end
  
  function unit:ResetToOriPosition()
    if self.oriPosition then
      self.position = {
        x = self.oriPosition.x,
        y = self.oriPosition.y,
        z = self.oriPosition.z
      }
    end
  end
  
  function unit:SetPosition(isInit)
    if BattleMgr.isBattleServer == true then
      return
    end
    local position = self.position
    local posX = position.x
    local posY = position.y
    local posZ = position.z
    local displayPosition = self.displayPosition
    if posX == displayPosition.x and posY == displayPosition.y and posZ == displayPosition.z then
      return
    end
    if self.model then
      LuaUtil.SetLocalPos(self.model, posX, posY, posZ)
      if self.isGrid then
      elseif BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR and self.mixSkeleton then
        self.fixedSortingOrder = BATTLE_CONFIG_ENUM.SORTING_ORDER_INIT + 50
      end
      self:UpdateSortingOrder()
      self.UIPosition = self.model:Get3DPositionToUIPosition(battleCamera, hudCom)
    elseif self.effectModel then
      LuaUtil.SetLocalPos(self.effectModel, posX, posY, posZ)
      self:UpdateSortingOrder()
      self.UIPosition = self.effectModel:Get3DPositionToUIPosition(battleCamera, hudCom)
    else
      return
    end
    self.displayPosition.x = posX
    self.displayPosition.y = posY
    self.displayPosition.z = posZ
  end
  
  function unit:UpdatePathIndex()
  end
  
  function unit:UpdateSortingOrder()
    local order
    if self.fixedSortingOrder then
      order = self.fixedSortingOrder
    elseif self.buildingType == BATTLE_BUILDING_TYPE.TRAP_PERSIST then
      order = BATTLE_CONFIG_ENUM.SORTING_ORDER_TRAP
    else
      order = BATTLE_CONFIG_ENUM.SORTING_ORDER_INIT - self.position.z
    end
    if self.sortingOrder ~= order then
      self.sortingOrder = order
      if self.model then
        SortingHelper.SetOrderInLayer(self.model, order)
      elseif self.effectModel then
        LuaUtil.SetChildrenOrderInLayer(self.effectModel, math.ceil(order))
      elseif self.effectModelList then
        for _, v in ipairs(self.effectModelList) do
          LuaUtil.SetChildrenOrderInLayer(v, math.ceil(order))
        end
      end
    end
  end
  
  function unit:ChangeAnimation(spineState, is_loop, callBack, updateNow, mixDuration, force)
    if self.spineState == spineState then
      return false
    end
    if self.curState == BATTLE_STATE_ENUM.DESTROY and spineState ~= SPINE_STATE_ENUM.DIE then
      return
    end
    self.spineState = spineState
    if self.isDefense then
      if spineState == SPINE_STATE_ENUM.IDLE then
        spineState = SPINE_STATE_ENUM.DEFENSE_IDLE
      elseif spineState == SPINE_STATE_ENUM.RUN then
        spineState = SPINE_STATE_ENUM.DEFENSE_RUN
      end
    end
    local fashionConfig = self:GetFashionConfig()
    if fashionConfig and spineState == SPINE_STATE_ENUM.IDLE and fashionConfig.spd_random_idle then
      spineState = fashionConfig.spd_random_idle[math.random(1, #fashionConfig.spd_random_idle)]
      
      function callBack()
        self.spineState = nil
      end
    end
    self:SetAnimation(0, spineState, is_loop, function()
      if callBack then
        callBack(spineState)
      end
    end, updateNow or false, mixDuration)
    return true
  end
  
  function unit:DestroyModel(showModelDead)
    if self.isDisplayDestroyed == true then
      return
    end
    if self.summonFromUnit then
      local summonUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
      if summonUnit then
        summonUnit:RemoveSummonUid(self.uid)
      end
    end
    self:RemoveAllEffect()
    if self.messageBar then
      self.messageBar:Destroy()
      self.messageBar = nil
    end
    if self.burstEffect then
      BattleResourceManager:DestroyGameObject(self.burstEffect)
      self.burstEffect = nil
    end
    if self.model then
      self:SetGhost(false)
      SkeletonAnimationUtil.ClearBattleSpineHelper(self.model)
      self:SetAnimation(0, SPINE_STATE_ENUM.IDLE, true, nil, true, "0")
      SkeletonAnimationUtil.StopTrackIndex(self.model, 1, 0)
      SkeletonAnimationUtil.SetSecondaryAlbedo(self.model)
      BattleResourceManager:DestroyGameObject(self.model)
      self.model = nil
    end
    if self.effectModel then
      BattleResourceManager:DestroyGameObject(self.effectModel)
      self.effectModel = nil
    end
    if self.effectModelList then
      for i, v in ipairs(self.effectModelList) do
        BattleResourceManager:DestroyGameObject(v)
      end
      self.effectModel = nil
    end
    self.isDisplayDestroyed = true
  end
  
  function unit:DestroyModelWhenTransform()
    if self.messageBar then
      self.messageBar:Destroy()
      self.messageBar = nil
    end
    if self.model then
      self:SetGhost(false)
      SkeletonAnimationUtil.ClearBattleSpineHelper(self.model)
      self:SetAnimation(0, SPINE_STATE_ENUM.IDLE, true, nil, true, "0")
      SkeletonAnimationUtil.StopTrackIndex(self.model, 1, 0)
      local preModel = self.model
      SkeletonAnimationUtil.SetSecondaryAlbedo(self.model)
      BattleResourceManager:DestroyGameObject(self.model)
      self.model = nil
      return preModel
    end
  end
  
  function unit:DestroyModelDead()
    if self.model then
      BattleResourceManager:DestroyGameObject(self.model)
      self.model = nil
    end
  end
  
  function unit:Destroy()
    self:DestroyModel()
    self:DestroyModelDead()
    self:InitBaseData()
  end
  
  function unit:ClearBuff(isClear)
    local maxHpName = ATTR_ENUM.max_hp
    if true == isClear then
      local maxHpBuffValue = self:GetBuffAttr(maxHpName)
      if 0 ~= maxHpBuffValue then
        self.lastHpPer = self.tempHpPer
      end
    end
    if true ~= isClear then
      local buff
      local savedBuffList = BattleBuffMgr.savedBuffList
      local buffUidList = self.buffUidList
      local buffUidArray = table.mapKey2Array(buffUidList, function(array)
        table.sort(array, function(a, b)
          return a < b
        end)
      end)
      for _, uid in ipairs(buffUidArray) do
        buff = savedBuffList[uid]
        if buff then
          buff:Remove()
        end
      end
    end
    self.cachedBuffEffect = {}
    self.cachedBuffControlType = {}
    self.cachedBuffEffectTag = {}
    self.cachedBuffAttr = {}
    self.buffUidList = {}
    if true == isClear and self.lastHpPer ~= nil then
      self:ChangeHpAdaptToMax(true)
      self:UpdateTempHpPerAndMessageBar()
    end
  end
  
  function unit:ContainBuffId(buffId)
    local buffUidList = self.buffUidList
    local buff
    local savedBuffList = BattleBuffMgr.savedBuffList
    for uid, enbale in pairs(buffUidList) do
      buff = savedBuffList[uid]
      if buff and buff.id == buffId then
        return true
      end
    end
    return false
  end
  
  function unit:GetCachedDistance(targetUnit)
    local dis = self.cachedDistance[targetUnit.uid]
    if dis then
      return dis
    end
    local coverR = targetUnit.coverRadiusR
    if nil ~= coverR then
      local position = targetUnit.position
      local selfPosition = self.position
      local distance = MathUtil.TruncateFloat(math.sqrt((selfPosition.x - position.x) ^ 2 + (selfPosition.y - position.y) ^ 2 + (selfPosition.z - position.z) ^ 2) * BattleScene.pixelsPerUnit - self.coverRadiusR - coverR)
      self.cachedDistance[targetUnit.uid] = distance
      targetUnit.cachedDistance[self.uid] = distance
    end
  end
  
  function unit:SetState(state, fromControl)
    if state ~= BATTLE_STATE_ENUM.DESTROY and self.curState == BATTLE_STATE_ENUM.PERSIST_CAST and state == BATTLE_STATE_ENUM.STUN then
      print_battle("眩晕不会改变持续施法的状态", self.positionIndex)
      return
    end
    if self.curState == BATTLE_STATE_ENUM.DESTROY then
      return
    end
    if state ~= BATTLE_STATE_ENUM.FEAR then
      self.fearTargetPosition = nil
      self.fearStartPosition = nil
    end
    if true == fromControl and state == BATTLE_STATE_ENUM.STAND then
      if self.isStun then
        state = BATTLE_STATE_ENUM.STUN
      elseif self.isPersistCast then
        state = BATTLE_STATE_ENUM.PERSIST_CAST
      end
    end
    print_battle("状态变化 ", self.positionIndex, " 当前状态：", self.curState, " 改变后状态：", state)
    if self.curState ~= nil then
      self.preState = self.curState
    end
    self.curState = state
  end
  
  function unit:SetStateToRevive(delayFrameRevive, buffFromUid)
    self.canTriggerSelfDyingSkill = true
    if delayFrameRevive then
      self.waitFrameDying = delayFrameRevive
    end
    BattleScene.DealClearTarget(self)
    if buffFromUid == self.uid and (self.curState == BATTLE_STATE_ENUM.ATTACK or self.curState == BATTLE_STATE_ENUM.ATTACK_OVER) then
    else
      BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.REVIVE)
    end
  end
  
  function unit:SetStateToDead(fromDying)
    local contain, _, buffs = BattleBuffMgr.GetContainedEffect(self, BUFF_EFFECT_ID.SLOW_DOWN_ATK_SPD_TRANS, nil, true)
    if contain then
      local fromUnit
      for _, buff in ipairs(buffs) do
        self:RemoveBuff(buff.uid, buff.needShowBuffIcon)
        fromUnit = BattleScene.GetUnitByUid(buff.fromUnitUid)
        if fromUnit:IsAlive() then
          if fromUnit.tempBuffListForTrans == nil then
            fromUnit.tempBuffListForTrans = {}
          end
          buff.toUnitUid = nil
          BattleBuffMgr.RefreshRegisterDeduceListener(buff)
          buff.pause = true
          table.insert(fromUnit.tempBuffListForTrans, buff)
        end
      end
    end
    BattleScene.DealClearTarget(self)
    BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.DEAD)
    if BattleData.scoreInfo and fromDying and self.camp == BATTLE_CAMP_FLAG.RIGHT and self.monsterRank >= 0 then
      BattleData.UpdateBattleScore(self)
    end
  end
  
  function unit:SetStateToDestroy()
    self:ClearBuff()
    BattleTransform.RemoveTransformWait(self.uid)
    BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.DESTROY)
    BattleScene.RemoveUnit(self)
    self.curPathIndexX = nil
    self.curPathIndexY = nil
    if nil ~= self.summonId then
      self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_NO_SUMMON)
      self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_SUMMON_LESS_EQUAL)
    end
  end
  
  function unit:AddStateAction(state, action, actionDisplay)
    self.states[state] = {action = action, actionDisplay = actionDisplay}
  end
  
  function unit:TriggerTransBuff()
    if self.tempBuffListForTrans then
      local list = self.tempBuffListForTrans
      local toUnitUid = self:GetAttackTargetUid()
      if toUnitUid then
        local toUnit = BattleScene.GetUnitByUid(toUnitUid)
        if toUnit and toUnit:IsAlive() and toUnit.camp == self.enemyCamp then
          for _, buff in ipairs(list) do
            buff.toUnitUid = toUnitUid
            buff.pause = false
            toUnit:AddBuff(buff.uid)
            if false == BattleMgr.isBattleServer then
              BattleAction.DealBuffSettle(toUnit, buff)
            end
            buff:TriggerUnitAttrChanged(toUnit, true)
            BattleBuffMgr.RefreshRegisterDeduceListener(buff)
          end
          self.tempBuffListForTrans = nil
        end
      end
    end
  end
  
  function unit:Update(isSecond)
    if self:IsDestroy() == true then
      return
    end
    if true == self.invalidUpdate then
      return
    end
    local remainTime = self.remainTime
    if remainTime and remainTime > 0 then
      remainTime = remainTime - 1
      if remainTime <= 0 then
        self.needDestroy = true
      end
      self.remainTime = remainTime
    end
    local burstWaitFrame = self.burstSkillWaitFrame
    if burstWaitFrame > 0 then
      burstWaitFrame = burstWaitFrame - 1
      self.burstSkillWaitFrame = burstWaitFrame
      if 0 == burstWaitFrame and BattleMgr.isBattleServer == false then
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BURST_CD_EFFECT, self.uid)
      end
    end
    if true == self.isFreeze or true == self.isPetrified or true == self.isTimePause then
      if BattleMgr.isBattleServer == false then
        BattleAction.UpdateModelTimescale(self)
      end
      return
    end
    self:UpdateState(isSecond)
    BattleAction.UpdateModelFlipWhenAttack(self)
    if BattleMgr.isBattleServer == false then
      BattleAction.UpdateModelTimescale(self)
      if self.id == SPECIAL_CARD_OR_MONSTER.GUI_SHI then
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {unit = self})
      end
    end
  end
  
  function unit:DealTriggerPartnerSkillAll(specificCondition, includeSelf, triggerFromUnitUid)
    local unitList = BattleScene.GetUnitListByPartnerTrigger(self, specificCondition, includeSelf)
    if nil == unitList or 0 == #unitList then
      return
    end
    for i = 1, #unitList do
      unitList[i]:DealTriggerSkillAll(specificCondition, triggerFromUnitUid)
    end
  end
  
  function unit:DealTriggerEnemySkillAll(specificCondition, triggerFromUnitUid)
    local unitList = BattleScene.GetUnitListByEnemyTrigger(self, specificCondition)
    if nil == unitList or 0 == #unitList then
      return
    end
    for i = 1, #unitList do
      unitList[i]:DealTriggerSkillAll(specificCondition, triggerFromUnitUid)
    end
  end
  
  function unit:DealTriggerPassiveSkill(specificCondition)
    local skillTable = self.passiveSkillTriggerTable[specificCondition]
    if nil ~= skillTable then
      BattleAction.DealTriggerPassiveSkill(self, specificCondition, skillTable)
    end
  end
  
  function unit:DealTriggerSkillAll(specificCondition, triggerFromUnitUid)
    local skillTable = self.passiveSkillTriggerTable[specificCondition]
    if nil ~= skillTable then
      BattleAction.DealTriggerPassiveSkill(self, specificCondition, skillTable, triggerFromUnitUid)
    end
    skillTable = self.otherSkillTriggerTable[specificCondition]
    if nil ~= skillTable then
      BattleAction.DealTriggerSkill(self, specificCondition, skillTable, triggerFromUnitUid)
    end
  end
  
  function unit:UpdateState(isSecond)
    local DealTriggerSkillAllFunc = self.DealTriggerSkillAll
    if self.savedFirstAttackFrame == nil and self.curState == BATTLE_STATE_ENUM.WAIT_ATTACK then
      self.savedFirstAttackFrame = BattleControl.curFixedFrame
      DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.TIME_LOOP_FIRST_ATTACK)
    end
    if self.curState ~= BATTLE_STATE_ENUM.START then
      if isSecond then
        DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.TIME_FIXED)
        DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.TIME_LOOP)
        DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.TIME_LOOP_FIRST_ATTACK)
        DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.PARTNER_NO_SUMMON)
        DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.PARTNER_SUMMON_LESS_EQUAL)
      end
      DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.FRAME_FIXED)
      DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.PARTNER_HP_LOSS)
      DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543)
      DealTriggerSkillAllFunc(self, TRIGGER_CONDITION.PARTNER_RANGED_HP_LOSS)
    end
    self:DealStateAction()
  end
  
  function unit:DealStateAction()
    local action = self.states[self.curState]
    if action and action.action then
      action = action.action
      action(self)
    end
  end
  
  function unit:UpdateRagePerSecond(ratio)
    if self:IsDestroy() then
      return
    end
    local rageTime = self:GetAttr(ATTR_ENUM.rage_time) * ratio
    if rageTime > 0 then
      BattleAction.DealRageChange(self, rageTime)
    end
  end
  
  function unit:UpdateDisplay(forceClose)
    if self.noDisplay == true then
      return
    end
    if true == self.isDisplayDestroyed then
      return
    end
    if true == self.invalidUpdate then
      return
    end
    if true ~= forceClose then
      self:UpdateStateDisplay()
      self:UpdateCurMotionState()
      self:UpdateFlip()
      self:UpdateModelTimeScale()
      if self.messageBar then
        BattleActionDisplay.PlayHurt(self)
        BattleActionDisplay.PlayRage(self)
      end
      BattleActionDisplay.PlayBuffWords(self)
      BattleActionDisplay.PlayBuffEffect(self)
    end
  end
  
  function unit:UpdateShowInSkillRange(inRange, backcolor)
    if inRange ~= self.outlineEnable then
      self.outlineEnable = inRange
      if self.model then
        SkeletonAnimationUtil.SetShaderEffectEnable(self.model, self.lightEnable, self.shadowEnable, self.outlineEnable)
      end
      if inRange and backcolor then
        if self.model then
          SkeletonAnimationUtil.SetBackcolor(self.model, backcolor.r, backcolor.g, backcolor.b, backcolor.a)
        elseif self.effectModel then
          LuaUtil.SetOutLineColor(self.effectModel, 1, backcolor.r, backcolor.g, backcolor.b, backcolor.a)
        end
      elseif false == inRange and self.effectModel then
        LuaUtil.SetOutLineColor(self.effectModel, 0, 255, 255, 255, 255)
      end
    end
  end
  
  function unit:SetModelTimeScale(timeScale, forceUpdateDisplay)
    self.savedModelTimeScale = timeScale
    if forceUpdateDisplay and BattleMgr.isBattleServer == false then
      self:UpdateModelTimeScale()
    end
  end
  
  function unit:UpdateModelTimeScale()
    if self.modelTimeScale ~= self.savedModelTimeScale and self.model then
      if nil == invisibleOff then
        invisibleOff = Vector3(10000, 0, 0)
      end
      local timeScale = self.savedModelTimeScale
      if nil == self.modelAnimationList then
        self.modelAnimationList = {}
        if self.mixSkeleton then
          local animations = self.model:GetComponentsInChildren(typeof(SkeletonAnimation), true)
          for i = 0, animations.Length - 1 do
            table.insert(self.modelAnimationList, animations[i])
          end
        else
          table.insert(self.modelAnimationList, SkeletonAnimationUtil.GetSkeletonAnimation(self.model))
        end
      end
      for i, amination in ipairs(self.modelAnimationList) do
        amination.timeScale = timeScale
      end
      local list = self.skillEffectList
      for key, v in pairs(list) do
        if v.effect then
          if 0 == timeScale then
            v.effect.transform.localPosition = v.effect.transform.localPosition + invisibleOff
          elseif 0 == self.modelTimeScale then
            v.effect.transform.localPosition = v.effect.transform.localPosition - invisibleOff
          end
          EffectUtil.SetEffectSpeed(v.effect, timeScale)
        end
      end
      self.modelTimeScale = timeScale
    end
  end
  
  function unit:UpdateStateDisplay()
    self:DealStateActionDisplay(self.curState)
  end
  
  function unit:ShowEffectInBurst()
    if self.model == nil then
      return
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BURST_CARD, nil, self.model)
    local burstCardShow = 0
    if self.camp == BATTLE_CAMP_FLAG.LEFT then
      burstCardShow = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BURST_CARD_SHOW, PLAYER_PREF_DEFAULT_VALUE.BATTLE_BURST_CARD_SHOW)
    end
    if nil == self.burstEffect and 1 ~= burstCardShow then
      local effectPath = "Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_battle_rocktime_char.prefab"
      local burstEffect = ResourceManager.Instantiate(effectPath)
      self.burstEffect = burstEffect
      local fashionConfig = self:GetFashionConfig()
      if fashionConfig.head_icon_burst then
        LuaUtil.ChangeTextureValue(burstEffect, "_MainTex", "Assets/Art/TextureSingle/BurstHead/" .. fashionConfig.head_icon_burst, "head_icon")
      end
      BattleResourceManager:AddGameObject(burstEffect, self.position.x, self.position.y, self.position.z, self.isFlip and -1 or 1, 1, 1)
      BattleResourceManager:SetGameObjectUnscaledTime(burstEffect)
    elseif self.burstEffect then
      self.burstEffect:SetActiveSafe(true)
      BattleResourceManager:AddGameObject(self.burstEffect, self.position.x, self.position.y, self.position.z, self.isFlip and -1 or 1, 1, 1)
      BattleResourceManager:SetGameObjectUnscaledTime(self.burstEffect)
    end
    local targetOrder = self.sortingOrder - BATTLE_CONFIG_ENUM.SORTING_ORDER_INIT
    SortingHelper.SetOrderInLayer(self.model, targetOrder)
    if self.burstEffect then
      SortingHelper.SetOrderInLayer(self.burstEffect, targetOrder - 1)
    end
    BattleHurtNum.ShowBattleSkillTipsAni(self, BATTLE_SKILL_ENUM.BURST_CARD, self.burstSkill, true)
    BattleResourceManager:SetGameObjectUnscaledTime(self.model)
    self:ChangeAnimation("skill3_prepare", false)
    BattleResourceManager:SetAllGameObjectDarkColor(true, 0.2, 0.2, 0.2, 1)
    BattleHurtNum.SetGrayAll(true)
    local curShowConfig = self:GetSkillShowConfig(self.curSkill.id)
    local displayConfig = self:GetCurSkillShowDisplayConfig(curShowConfig)
    local prepareEffectPath = displayConfig.prepare_effect
    if prepareEffectPath then
      local effect = self:CreateSkillEffect(curShowConfig, EffectUtil.GetFullPath(prepareEffectPath))
      if effect then
        BattleResourceManager:SetGameObjectUnscaledTime(effect)
      end
    end
    local soundList = displayConfig.prepare_effect_sound
    if soundList then
      for i, v in ipairs(soundList) do
        local config = TableData.GetConfig(v, "BaseSoundPath")
        if config then
          SoundUtil.PlaySfxInBattle(config.path, config.bank, self.model)
        end
      end
    end
    local targetUidList = self:GetTargetUidList()
    for _, uid in ipairs(targetUidList) do
      local target = BattleScene.GetUnitByUid(uid)
      if target:CanTargetChosen() then
        BattleResourceManager:SetGameObjectDarkColor(target.model or target.effectModel, true, 1, 1, 1, 1)
        if target.messageBar then
          target.messageBar:SetAlpha(1)
        end
      end
    end
  end
  
  function unit:HideEffectInBurst()
    if self.burstEffect then
      self.burstEffect:SetActiveSafe(false)
    end
    if self.model then
      SortingHelper.SetOrderInLayer(self.model, self.sortingOrder)
    end
    BattleResourceManager:SetAllGameObjectDarkColor(false, 1, 1, 1, 1)
    BattleResourceManager:ResetGameObjectUnscaledTime(self.model)
    BattleHurtNum.SetGrayAll(false)
  end
  
  function unit:CreateEffect(name, path, autoDestroy, bindSlot, bindChildName)
    if self.model == nil and nil == self.effectModel then
      return
    end
    local saveList = self.otherEffectList[name]
    if true ~= autoDestroy and saveList then
      saveList.reference = saveList.reference + 1
      return
    end
    if saveList then
      self:RemoveEffect(name)
    end
    local effect = ResourceManager.Instantiate(path)
    if self.model ~= nil then
      local pos = {x = 0, y = 0}
      pos = bindSlot and SkeletonAnimationUtil.GetPointPositionBySlotName(self.model, bindSlot) or pos
      BattleResourceManager:AddGameObject(effect, pos.x, pos.y * BattleMgr.rotationCos, pos.y * BattleMgr.rotationSin)
      if bindChildName then
        SkillEffectsHelper.BindObject(effect, self.model, bindChildName)
      else
        SkillEffectsHelper.BindObject(effect, self.model, nil, bindSlot)
      end
      local fashionConfig = self:GetFashionConfig()
      if fashionConfig then
        SkillEffectsHelper.ScaleWithFashion(effect, fashionConfig.effect_scale, 10000)
      end
    elseif nil ~= self.effectModel then
      BattleResourceManager:AddGameObject(effect, self.position.x, self.position.y, self.position.z)
      SkillEffectsHelper.BindObject(effect, self.effectModel)
    end
    if SkillEffectsHelper.IsRotationWithAttackDirection(effect) == false then
      EffectUtil.Overturn(effect, self.isFlip)
    end
    self.otherEffectList[name] = {effect = effect, reference = 1}
    if autoDestroy then
      EffectUtil.SetAutoDestroyCallback(effect, function()
        if BattleControl.isOver == true then
          return
        end
        self:RemoveEffect(name)
      end)
    else
      EffectUtil.SetAutoDestroyCallback(effect)
    end
    return effect
  end
  
  function unit:CreateSkillEffect(skillShowConfig, path, autoDestroy)
    if self.model == nil then
      return
    end
    if nil == autoDestroy then
      autoDestroy = true
    end
    local effect = ResourceManager.Instantiate(path)
    BattleResourceManager:AddGameObject(effect, self.position.x, self.position.y, self.position.z)
    local skillLevelUpConfig = self:GetSkillLevelUpConfig(self.curSkill.id)
    EffectUtil.Overturn(effect, self.isFlip)
    if skillLevelUpConfig.range_x and skillLevelUpConfig.range_type == BATTLE_RANGE_TYPE.RECT_SELF_2_TARGET then
      local rangeType, rangeX, rangeY = BattleChoose.GetRangeInfo(skillLevelUpConfig, nil, self)
      SkillEffectsHelper.SetScaleRatio(effect, rangeX / BattleScene.pixelsPerUnit)
    end
    if SkillEffectsHelper.IsDirectionToTarget(effect) then
      local uids = self:GetTargetUidList()
      if #uids > 0 then
        local target = BattleScene.GetUnitByUid(uids[1])
        if target then
          SkillEffectsHelper.UpdateEffectDirection(effect, self.model, target.model or target.effectModel, skillShowConfig.start_points and skillShowConfig.start_points[1] or "", skillShowConfig.end_points and skillShowConfig.end_points[1] or "")
        end
      end
    elseif skillShowConfig.effect_points then
      local pos = self:GetPointPositionBySlotName(skillShowConfig.effect_points[1])
      if pos then
        LuaUtil.SetLocalPos(effect, pos.x, pos.y, pos.z)
      end
    elseif self.mixSkeleton then
      local name = skillShowConfig.start_points and skillShowConfig.start_points[1] or ""
      if string.isEmptyOrNil(name) == false and self.pointObjectList[name] then
        local pointObject = self.pointObjectList[name]
        effect.transform.parent = pointObject.transform
        LuaUtil.SetLocalPos(effect, 0, 0, 0)
      else
        SkillEffectsHelper.BindObject(effect, self.model)
      end
    else
      SkillEffectsHelper.BindObject(effect, self.model, nil, skillShowConfig.start_points and skillShowConfig.start_points[1] or "")
    end
    EffectUtil.SetEffectSpeed(effect, self.modelTimeScale)
    local instanceId = effect:GetInstanceID()
    self.skillEffectList[instanceId] = {effect = effect}
    if autoDestroy then
      EffectUtil.SetAutoDestroyCallback(effect, function()
        if BattleControl.isOver == true then
          return
        end
        self:RemoveEffect(instanceId, true)
      end)
    else
      EffectUtil.SetAutoDestroyCallback(effect)
    end
    return effect
  end
  
  function unit:GetHitPointName()
    local fashionConfig = self:GetFashionConfig()
    if fashionConfig and fashionConfig.hit_random_points then
      local points = fashionConfig.hit_random_points
      if #points > 0 then
        return points[math.random(1, #points)]
      end
    end
    return "hit"
  end
  
  function unit:GetPointPositionBySlotName(pointName)
    if self.model == nil then
      return
    end
    if self.mixSkeleton then
      for i, v in ipairs(self.skeletonModelList) do
        local pos = SkeletonAnimationUtil.GetPointPositionBySlotName(v, pointName)
        if pos then
          pos = pos + v.transform.localPosition
          return {
            x = pos.x + self.position.x,
            y = pos.y * BattleMgr.rotationCos + self.position.y,
            z = pos.y * BattleMgr.rotationSin + self.position.z
          }
        end
      end
    else
      local pos = SkeletonAnimationUtil.GetPointPositionBySlotName(self.model, pointName)
      if pos then
        return {
          x = pos.x + self.position.x,
          y = pos.y * BattleMgr.rotationCos + self.position.y,
          z = pos.y * BattleMgr.rotationSin + self.position.z
        }
      end
    end
  end
  
  function unit:UpdateEffectFlip(key, isSkill)
    if nil == key then
      return
    end
    local info
    if true == isSkill then
      info = self.skillEffectList[key]
    else
      info = self.otherEffectList[key]
    end
    if info then
      local effect = info.effect
      if effect and SkillEffectsHelper.IsRotationWithAttackDirection(effect) == false then
        EffectUtil.Overturn(effect, self.isFlip)
      end
      local effectList = info.effectList
      if effectList then
        for i, eff in ipairs(effectList) do
          if SkillEffectsHelper.IsRotationWithAttackDirection(eff) == false then
            EffectUtil.Overturn(eff, self.isFlip)
          end
        end
      end
    end
  end
  
  function unit:RemoveEffect(key, isSkill)
    if nil == key then
      return
    end
    local info
    if true == isSkill then
      info = self.skillEffectList[key]
    else
      info = self.otherEffectList[key]
    end
    if info then
      if info.reference then
        info.reference = info.reference - 1
      end
      if nil == info.reference or info.reference <= 0 then
        local effect = info.effect
        if effect then
          BattleResourceManager:DestroyGameObject(effect)
        end
        local effectList = info.effectList
        if effectList then
          for i, eff in ipairs(effectList) do
            BattleResourceManager:DestroyGameObject(eff)
          end
        end
        if true == isSkill then
          self.skillEffectList[key] = nil
        else
          self.otherEffectList[key] = nil
        end
      end
    end
  end
  
  function unit:RemoveAllEffect()
    self:RemoveAllBuffEffect()
    self:RemoveAllSkillEffect()
  end
  
  function unit:RemoveAllBuffEffect()
    for name, _ in pairs(self.otherEffectList) do
      self:RemoveEffect(name)
    end
  end
  
  function unit:RemoveAllSkillEffect()
    local list = self.skillEffectList
    for key, v in pairs(list) do
      self:RemoveEffect(key, true)
    end
  end
  
  function unit:DealStateActionDisplay(state)
    local action = self.states[state]
    if action and action.actionDisplay then
      action = action.actionDisplay
      action(self)
    end
  end
  
  function unit:ChooseMoveTarget(onlyMove)
    if self.canMoveOrAttack == false then
      return nil, false, false
    end
    if self:GetNormalSkillId() == nil then
      return nil, false, false
    end
    if self.isTrick == true then
      return
    end
    if true == BattleControl.isOver then
      return nil, false, false
    end
    local curTarget, changeToAttack, moveFront = nil, false, false
    local moveTargetUid = self:GetMoveTargetUid()
    if nil == moveTargetUid then
      local nearestUnitList = BattleChoose.GetUnitForChooseMoveTarget(self)
      if #nearestUnitList <= 0 then
        if self.curState == BATTLE_STATE_ENUM.MOVE then
          BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
        end
        return curTarget, changeToAttack, moveFront
      end
      if self.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
        if self.curState == BATTLE_STATE_ENUM.START then
          for i = 1, #nearestUnitList do
            local v = nearestUnitList[i]
            if BattleScene.IsTargetCounter(self, v) then
              curTarget = v
              break
            end
          end
          if nil == curTarget then
            for i = 1, #nearestUnitList do
              local v = nearestUnitList[i]
              if v.isSupportOrRanged then
                curTarget = v
                break
              end
            end
          end
          if nil ~= curTarget then
            self:SetMoveTargetUid(curTarget.uid)
          end
        else
          local v
          for i = 1, #nearestUnitList do
            v = nearestUnitList[i]
            if v.isSupportOrRanged then
              curTarget = v
              break
            end
          end
        end
        if nil ~= curTarget then
          if self.rangeFind > 0 and false == self:IsTargetInFindRange(curTarget) then
            moveFront = true
            self.speed = BattleScene.GetSpeed(self.position, curTarget.position, math.min(self.cachedDistance[curTarget.uid], MathUtil.TruncateFloat(self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS)), moveFront, true)
            return nil, changeToAttack, moveFront
          end
          self:SetMoveTargetUid(curTarget.uid)
          self.speed = BattleScene.GetSpeed(self.position, curTarget.position, math.min(self.cachedDistance[curTarget.uid], MathUtil.TruncateFloat(self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS)), nil, true)
          return curTarget, changeToAttack, moveFront
        end
      end
      if self.rangeFind > 0 and false == self:IsTargetInFindRange(nearestUnitList[1]) then
        moveFront = true
        self.speed = BattleScene.GetSpeed(self.position, nearestUnitList[1].position, math.min(self.cachedDistance[nearestUnitList[1].uid], MathUtil.TruncateFloat(self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS)), moveFront, true)
        return curTarget, changeToAttack, moveFront
      end
      if #nearestUnitList > 0 then
        curTarget = nearestUnitList[1]
      else
        if self.curState == BATTLE_STATE_ENUM.MOVE then
          BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
        end
        return curTarget, changeToAttack, moveFront
      end
    else
      curTarget = BattleScene.GetUnitByUid(moveTargetUid)
      if false == curTarget:CanTargetChosen() then
        local targetUid = curTarget.uid
        if targetUid == self.charmUid then
          self:SetCharmUid()
        end
        if targetUid == self.beAttractedUid then
          self:SetBeAttractedUid()
        end
        self:SetMoveTargetUid()
        BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
        return nil, changeToAttack, moveFront
      end
      if self.rangeFind > 0 and false == self:IsTargetInFindRange(curTarget) then
        moveFront = true
        self.speed = BattleScene.GetSpeed(self.position, curTarget.position, math.min(self.cachedDistance[curTarget.uid], MathUtil.TruncateFloat(self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS)), moveFront, true)
        return nil, changeToAttack, moveFront
      end
    end
    if true ~= onlyMove and self:IsTargetInAttackRange(curTarget) and (self.curState == BATTLE_STATE_ENUM.MOVE or self.curState == BATTLE_STATE_ENUM.STAND) then
      if self.isDefense then
        BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
      else
        local skillId, skillType = BattleAction.DealCheckSkill(self, curTarget.uid)
        if skillId and skillType then
          changeToAttack = true
          return curTarget, changeToAttack, moveFront
        end
      end
    end
    self.speed = BattleScene.GetSpeed(self.position, curTarget.position, math.min(self.cachedDistance[curTarget.uid], MathUtil.TruncateFloat(self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS)), nil, true)
    return curTarget, changeToAttack, moveFront
  end
  
  function unit:ContainControlType(controlType)
    return 1 == self.cachedBuffControlType[controlType]
  end
  
  function unit:ContainBuffEffectTag(tag)
    return 1 == self.cachedBuffEffectTag[tag]
  end
  
  function unit:ContainPersistentDamage()
    return self:ContainBuffEffectTag(BUFF_EFFECT_TAG.PERSIST_DAMAGE)
  end
  
  function unit:ContainControl()
    return self:ContainBuffEffectTag(BUFF_EFFECT_TAG.CONTROL)
  end
  
  function unit:CanMove()
    if self.isBuilding == false then
      return false == self:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_MOVE)
    end
  end
  
  function unit:CanChoose(target)
    if self.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK or self.battleUnitType == BATTLE_UNIT_TYPE.SUPPORT then
      return true
    end
    local count = BattleScene.GetUnitBlockCountByTargetUid(target.uid)
    if count + self:GetBlockCount() <= target:GetBlockMax() then
      return true
    end
  end
  
  function unit:Transform(transformTo, transformEffect, transformKeepSkillIndex, sound, pause)
    local dataParam = {
      id = transformTo,
      uid = self.uid,
      hp = self:GetHp(),
      rage = self:GetRage(),
      pos = self.positionIndex
    }
    local callback = function(battleUnit)
      battleUnit:ClearControlStateWhenTransform()
      battleUnit:InitBaseData(true, transformKeepSkillIndex)
      battleUnit:InitData(dataParam)
      battleUnit:InitCoverRadius()
      battleUnit.cachedDistance[battleUnit.uid] = 0
      BattleScene.UpdateCacheDistance(battleUnit)
      battleUnit:UpdateActionSpeed()
      battleUnit:UpdateMoveSpeed()
      battleUnit:SetState(BATTLE_STATE_ENUM.START)
    end
    if BattleMgr.isBattleServer == false then
      self:SetModelTimeScale(1, true)
      BattleActionDisplay.PlayTransform(self, transformEffect, sound, callback, pause)
    else
      callback(self)
    end
  end
  
  function unit:IsTargetInAttackRange(targetUnit)
    if self.cachedDistance[targetUnit.uid] > self.tempRangeAtk then
      return false
    end
    if targetUnit:CanTargetChosen() == false then
      return false
    end
    return true
  end
  
  function unit:IsTargetInAttackRangeByUid(targetUid)
    if self.cachedDistance[targetUid] > self.tempRangeAtk then
      return false
    end
    local target = BattleScene.GetUnitByUid(targetUid)
    if target:CanTargetChosen() == false then
      return false
    end
    return true
  end
  
  function unit:IsTargetInFindRange(targetUnit)
    if nil == targetUnit then
      return false
    end
    if targetUnit:CanTargetChosen() == false then
      return false
    end
    if -1 == self.rangeFind then
      return true
    end
    if self:IsTargetInAttackRange(targetUnit) then
      return true
    end
    return abs(targetUnit.position.x - self.position.x) * BattleScene.pixelsPerUnit <= self.rangeFind
  end
  
  function unit:IsTargetInFindRangeByUid(targetUid)
    local target = BattleScene.GetUnitByUid(targetUid)
    if nil == target then
      return false
    end
    if target:CanTargetChosen() == false then
      return false
    end
    if self:IsTargetInAttackRange(target) then
      return true
    end
    if -1 == self.rangeFind then
      return true
    end
    return abs(target.position.x - self.position.x) * BattleScene.pixelsPerUnit <= self.rangeFind
  end
  
  function unit:GetBaseConfig()
    if self.baseConfig == nil then
      local config, isMonster, isBuilding = CardData.GetBaseConfig(self.id)
      self.baseConfig, self.isMonster, self.isBuilding = config, isMonster, isBuilding
      if isBuilding then
        self.buildingType = config.type
      end
      if isMonster then
        self.monsterRank = config.rank
      end
      return config, isMonster, isBuilding
    else
      return self.baseConfig, self.isMonster, self.isBuilding
    end
  end
  
  function unit:GetBaseCardOrMonsterConfig()
    local baseConfig, _, isBuilding = self:GetBaseConfig()
    if true ~= isBuilding then
      self.baseCardOrMonsterConfig = baseConfig
      return baseConfig
    end
    if self.baseCardOrMonsterConfig == nil then
      local monsterId = baseConfig.monster_id
      if monsterId then
        local config = TableData.GetConfig(monsterId, "BaseMonster")
        self.baseCardOrMonsterConfig = config
        return config
      end
    else
      return self.baseCardOrMonsterConfig
    end
  end
  
  function unit:GetFashionBubbleConfig()
    if self.fashionBubbleConfig == nil then
      local fashionConfig = self:GetFashionConfig()
      if fashionConfig then
        local bubbleId = fashionConfig.bubble_id
        self.fashionBubbleConfig = TableData.GetConfig(bubbleId, "BaseFashionBubble")
      end
    end
    return self.fashionBubbleConfig
  end
  
  function unit:GetFashionConfig()
    if self.fashionConfig == nil then
      self.fashionConfig = TableData.GetConfig(self.fashionId, "BaseFashion")
    end
    return self.fashionConfig
  end
  
  function unit:GetGradeUpConfig()
    if self.gradeUpConfig == nil then
      local key = self.id * 1000 + self.grade
      self.gradeUpConfig = TableData.GetConfig(key, "BaseCardGradeUp")
    end
    return self.gradeUpConfig
  end
  
  function unit:InitSkillList()
    local config = self:GetBaseCardOrMonsterConfig()
    if config then
      self.oriSkillList = config.skill_list
      self.loopSkillList = config.loop_skill_list
      if self.curSkillIndex == nil then
        self.curSkillIndex = 1
      end
    end
  end
  
  function unit:GetStartWaitFrame()
    if self.startWaitFrame == nil then
      self.startWaitFrame = self:GetFashionConfig().start_interval
    end
    return self.startWaitFrame
  end
  
  function unit:GetDefaultWaitFrame()
    if self.defaultWaitFrame == nil then
      self.defaultWaitFrame = self:GetFashionConfig().interval
    end
    return self.defaultWaitFrame
  end
  
  function unit:GetCurNeedWaitFrame()
    return self.curStartInterval or self.curNormalSkillInterval
  end
  
  function unit:GetNormalSkillId()
    if self.normalSkillId == nil then
      self.normalSkillId = self:GetBaseCardOrMonsterConfig().normal_skill
    end
    return self.normalSkillId
  end
  
  function unit:GetNormalSkillShowConfig()
    if self.normalSkillShowConfig == nil then
      local normalSkill = self:GetNormalSkillId()
      self.normalSkillShowConfig = self:GetSkillShowConfig(normalSkill)
    end
    return self.normalSkillShowConfig
  end
  
  function unit:GetSmallSkillLevelUpIds()
    local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
    if self.isMonster == true or true == self.isBuilding and cardOrMonsterConfig then
      return cardOrMonsterConfig.special_skill or {}
    else
      if true == self.isBuilding then
        return {}
      end
      local list = {}
      for skillId, level in pairs(self.skill2Level) do
        local tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
        local levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        if tempSkillConfig.type == BATTLE_SKILL_ENUM.SMALL then
          table.insert(list, levelUpConfig.id)
        end
      end
      return list
    end
  end
  
  function unit:GetUniqueSkillLevelUpIds()
    local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
    if self.isMonster == true or true == self.isBuilding and cardOrMonsterConfig then
      return cardOrMonsterConfig.unique_skill or {}
    else
      if true == self.isBuilding then
        return {}
      end
      local list = {}
      for skillId, level in pairs(self.skill2Level) do
        local tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
        local levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        if tempSkillConfig.type == BATTLE_SKILL_ENUM.UNIQUE then
          table.insert(list, levelUpConfig.id)
        end
      end
      return list
    end
  end
  
  function unit:GetBurstSkillLevelUpId()
    if self.burstSkill then
      local levelUpConfig = self:GetSkillLevelUpConfig(self.burstSkill)
      return levelUpConfig.id
    end
    return 0
  end
  
  function unit:GetExSkillLevelUpIds()
    local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
    if self.isMonster == true or true == self.isBuilding and cardOrMonsterConfig then
      return cardOrMonsterConfig.ex_skill or {}
    else
      if true == self.isBuilding then
        return {}
      end
      local list = {}
      for skillId, level in pairs(self.skill2Level) do
        local tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
        local levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        if tempSkillConfig.type == BATTLE_SKILL_ENUM.EX then
          table.insert(list, levelUpConfig.id)
        end
      end
      return list
    end
  end
  
  function unit:GetPassiveSkillLevelUpIds()
    local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
    if self.isMonster == true or true == self.isBuilding and cardOrMonsterConfig then
      return self.baseConfig.passive_skill or {}
    else
      if true == self.isBuilding then
        return self.baseConfig.passive_skill or {}
      end
      local list = {}
      for skillId, level in pairs(self.skill2Level) do
        local tempSkillConfig = TableData.GetConfig(skillId, "BaseSkill")
        local levelUpConfig = self:GetSkillLevelUpConfig(skillId, level)
        if tempSkillConfig.type == BATTLE_SKILL_ENUM.PASSIVE then
          table.insert(list, levelUpConfig.id)
        end
      end
      return list
    end
  end
  
  function unit:GetCurSkillShowDisplayConfig(skillShowConfig)
    local display_ids = skillShowConfig.display_ids
    if nil == display_ids then
      return
    end
    if 1 == #display_ids then
      return TableData.GetConfig(display_ids[1], "BaseSkillShowDisplay")
    end
    local skillShowId = skillShowConfig.id
    local cachedInfos = self.cachedSkillShowDisplayInfos
    local displayInfo = cachedInfos[skillShowId]
    if nil == displayInfo then
      displayInfo = {
        configs = {}
      }
      for i = 1, #display_ids do
        local displayConfig = TableData.GetConfig(display_ids[i], "BaseSkillShowDisplay")
        displayInfo.configs[#displayInfo.configs + 1] = displayConfig
      end
      cachedInfos[skillShowId] = displayInfo
    end
    if nil == displayInfo.curIndex or displayInfo.curIndex + 1 > #display_ids then
      displayInfo.curIndex = ceil(MathUtil.TruncateFloat(BattleData.GetRandomSeed() * #display_ids / 10000))
      return displayInfo.configs[displayInfo.curIndex]
    end
    displayInfo.curIndex = displayInfo.curIndex + 1
    return displayInfo.configs[displayInfo.curIndex]
  end
  
  function unit:GetSkillLevelUpConfig(skillId, level)
    if nil == skillId then
      print(1)
    end
    if nil == self.savedSkillLevelUpConfig[skillId] then
      local key = skillId * 1000 + (level or self:GetSkillLevel(skillId))
      self.savedSkillLevelUpConfig[skillId] = TableData.GetConfig(key, "BaseSkillLevelUp")
    end
    return self.savedSkillLevelUpConfig[skillId]
  end
  
  function unit:GetSubSkillConfig(skillId)
    if self.savedSubSkillConfig[skillId] == nil then
      self.savedSubSkillConfig[skillId] = TableData.GetConfig(skillId, "BaseSubSkill")
    end
    return self.savedSubSkillConfig[skillId]
  end
  
  function unit:GetSkillShowConfig(skillId)
    if self.savedSkillShowConfig[skillId] == nil then
      local showId = self.savedSkillShowId[skillId]
      if nil == showId then
        local skillLevelUpConfig = self:GetSkillLevelUpConfig(skillId)
        local fashionShowIds = skillLevelUpConfig.fashion_show_ids
        if fashionShowIds and #fashionShowIds > 0 then
          for i, v in ipairs(fashionShowIds) do
            local fashion2showId = Split(v, ":")
            if fashion2showId[1] == tostring(self.fashionId) then
              showId = tonumber(fashion2showId[2])
              self.savedSkillShowId[skillId] = showId
              self.savedSkillShowConfig[skillId] = TableData.GetConfig(showId, "BaseSkillShow")
              break
            end
          end
          if nil == showId then
            self.savedSkillShowId[skillId] = 0
            print_battle("找不到当前技能使用的skill show，技能id：", skillId, "当前fashionId：", self.fashionId)
            return nil, nil
          end
        elseif skillLevelUpConfig.show_id then
          showId = skillLevelUpConfig.show_id
          self.savedSkillShowId[skillId] = showId
          self.savedSkillShowConfig[skillId] = TableData.GetConfig(showId, "BaseSkillShow")
        else
          self.savedSkillShowId[skillId] = 0
          return nil, nil
        end
      elseif 0 == showId then
        return nil, nil
      end
    end
    return self.savedSkillShowConfig[skillId], self.savedSkillShowId[skillId]
  end
  
  function unit:GetCurSkillTotalFrame()
    if self.curSkill.id == nil then
      return
    end
    if self.curSkill.type == BATTLE_SKILL_ENUM.NORMAL then
      return self.curNormalSkillTotalFrame
    else
      local showConfig = self:GetSkillShowConfig(self.curSkill.id)
      if showConfig then
        return showConfig.total_f
      end
    end
  end
  
  function unit:InitCoverRadius()
    if self.isGrid == true then
      local half = BattleScene.ceilLength / 2
      self.coverRadiusHalfW = half
      self.coverRadiusHalfH = half
      self.coverRadiusR = half
      return
    end
    if self.isBuilding then
      local cardOrMonsterConfig = self:GetBaseCardOrMonsterConfig()
      if cardOrMonsterConfig then
        self.coverRadius = {
          r = self.baseConfig.range[1] / 2
        }
      else
        self.coverRadius = {
          halfW = self.baseConfig.range[1] / 2,
          halfH = self.baseConfig.range[2] / 2
        }
      end
    elseif self.fashionId then
      self.coverRadius = {
        r = self:GetFashionConfig().range / 2
      }
    else
      self.coverRadius = {
        halfW = self.baseConfig.range[1] / 2,
        halfH = self.baseConfig.range[2] / 2
      }
    end
    self.coverRadiusR = self.coverRadius.r
    self.coverRadiusHalfW = self.coverRadius.halfW
    self.coverRadiusHalfH = self.coverRadius.halfH
  end
  
  function unit:GetBlockMax()
    return self:GetAttr(ATTR_ENUM.block_max)
  end
  
  function unit:GetBlockCount()
    return self:GetAttr(ATTR_ENUM.block_count)
  end
  
  function unit:IsCannotChooseType()
    if self.isCannotChooseType == nil then
      if self.isBuilding == true and self.buildingType ~= BATTLE_BUILDING_TYPE.BLOCK and self.buildingType ~= BATTLE_BUILDING_TYPE.ATTACK then
        self.isCannotChooseType = true
        return true
      end
      self.isCannotChooseType = false
      return false
    end
    return self.isCannotChooseType
  end
  
  function unit:CanRangeChosen()
    if self:IsCannotChooseType() then
      return false
    end
    return self:IsAlive()
  end
  
  function unit:CanBuffChosen()
    if self:IsCannotChooseType() then
      return false
    end
    return self:IsAlive()
  end
  
  function unit:CanTargetChosen(chooseExtraParams)
    if self.isGrid then
      return true
    end
    if self:IsCannotChooseType() then
      return false
    end
    if self.unableToSelect == true then
      if chooseExtraParams and true == chooseExtraParams.includeStealth then
        if true == BattleBuffMgr.ContainEffectId(self, BUFF_EFFECT_ID.STEALTH) then
        else
          return false
        end
      else
        return false
      end
    end
    return self:IsAlive()
  end
  
  function unit:IsAlive()
    if self.isGrid then
      return true
    end
    local state = self.curState
    if state == BATTLE_STATE_ENUM.DESTROY then
      return false
    end
    if state == BATTLE_STATE_ENUM.DEAD then
      return false
    end
    if state == BATTLE_STATE_ENUM.REVIVE then
      return false
    end
    return true
  end
  
  function unit:IsDying()
    return self:IsRevive() or self:IsDead() or self.haveHp and self:GetHp() <= 0
  end
  
  function unit:IsRevive()
    return self.curState == BATTLE_STATE_ENUM.REVIVE
  end
  
  function unit:IsDead()
    return self.curState == BATTLE_STATE_ENUM.DEAD
  end
  
  function unit:IsDestroy()
    return self.curState == BATTLE_STATE_ENUM.DESTROY
  end
  
  function unit:GetJobConfig()
    if self.jobConfig == nil then
      self.jobConfig = TableData.GetConfig(self.battleUnitType, "BaseJob")
    end
    return self.jobConfig
  end
  
  function unit:GetSkillLevel(skillId)
    return self.skill2Level[skillId] or self.passiveSkillLevel[skillId] or 1
  end
  
  function unit:InitRestraint(baseConfig)
    baseConfig = baseConfig or self:GetBaseCardOrMonsterConfig()
    local attrName
    for i = 1, 5 do
      attrName = RestraintAddName[i]
      self:SetInitAttr(attrName, baseConfig[attrName])
      attrName = RestraintSubName[i]
      self:SetInitAttr(attrName, baseConfig[attrName])
    end
  end
  
  function unit:InitAttrMap(attributes)
    local config = TableData.GetTable("BaseAttribute")
    for attrId, value in pairs(attributes) do
      if config[attrId] then
        self.attrMap[config[attrId].name] = value
      end
    end
  end
  
  function unit:InitAttrMapMonsterConfig(monsterConfig, summonConfig, buffParams)
    local config = TableData.GetTable("BaseAttribute")
    local str
    for _, v in pairs(config) do
      str = v.name
      if monsterConfig[str] then
        self.attrMap[str] = monsterConfig[str]
      end
    end
    if summonConfig then
      local attrNameList = {
        ATTR_ENUM.max_hp,
        ATTR_ENUM.atk,
        ATTR_ENUM.def
      }
      local str, strs, effectDepend, effectCalType, effectCalAttrId, effectCalValue, effectCalAttrCalType
      local finalValue = 0
      local dependUnit, dependValue, attrName, name
      for i = 1, #attrNameList do
        name = attrNameList[i]
        str = summonConfig[name]
        if str then
          strs = Split(str, ":")
          effectDepend = tonumber(strs[1])
          effectCalType = tonumber(strs[2])
          effectCalAttrId = tonumber(strs[3])
          effectCalValue = tonumber(strs[4])
          effectCalAttrCalType = tonumber(strs[5])
          if effectDepend == BATTLE_DEPEND_TYPE.SUMMON_FROM_REALTIME then
            self.realTimeAttrList[name] = {
              effectDependUnitUid = self.summonFromUnit,
              effectCalType = effectCalType,
              effectCalAttrId = effectCalAttrId,
              effectCalValue = effectCalValue,
              effectCalAttrCalType = effectCalAttrCalType
            }
          else
            if effectDepend == BATTLE_DEPEND_TYPE.FROM then
              dependUnit = BattleScene.GetUnitByUid(buffParams.fromUnitUid)
              if effectCalType == BUFF_EFFECT_VALUE.VALUE then
                finalValue = effectCalValue
              elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT and 0 ~= effectCalAttrId then
                attrName = TableData.GetConfig(effectCalAttrId, "BaseAttribute").name
                if effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.BASIC then
                  dependValue = dependUnit:GetBaseAttr(attrName)
                elseif effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.CURRENT then
                  dependValue = dependUnit:GetAttr(attrName)
                end
                finalValue = ceil(MathUtil.TruncateFloat(dependValue * effectCalValue / 10000))
              end
            elseif effectDepend == BATTLE_DEPEND_TYPE.TO then
              dependUnit = BattleScene.GetUnitByUid(buffParams.toUnitUid)
              if effectCalType == BUFF_EFFECT_VALUE.VALUE then
                finalValue = effectCalValue
              elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT and 0 ~= effectCalAttrId then
                attrName = TableData.GetConfig(effectCalAttrId, "BaseAttribute").name
                if effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.BASIC then
                  dependValue = dependUnit:GetBaseAttr(attrName)
                elseif effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.CURRENT then
                  dependValue = dependUnit:GetAttr(attrName)
                end
                finalValue = ceil(MathUtil.TruncateFloat(dependValue * effectCalValue / 10000))
              end
            end
            finalValue = math.max(finalValue, 0)
            self:SetInitAttr(name, finalValue)
          end
        end
      end
    end
  end
  
  function unit:SetInitAttr(name, value)
    self.attrMap[name] = value
  end
  
  function unit:SetAttr(name, value)
    self.attrMap[name] = value
    if name == ATTR_ENUM.hp then
      self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_LOSS_PER)
      self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_PER)
      if self.id == SPECIAL_CARD_OR_MONSTER.HEI_YU then
        self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_PER_WITH_SUMMON)
      end
      if self.summonId == nil and self.isBuilding == false then
        self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_HP_LOSS)
        self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543)
        if self.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
          self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_RANGED_HP_LOSS)
        end
      end
    elseif name == ATTR_ENUM.rage then
      self:DealTriggerSkillAll(TRIGGER_CONDITION.RAGE_NEED)
    end
  end
  
  function unit:ChangeAttr(name, changeValue)
    self.attrMap[name] = self.attrMap[name] + changeValue
    if name == ATTR_ENUM.hp then
      self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_LOSS_PER)
      self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_PER)
      if self.id == SPECIAL_CARD_OR_MONSTER.HEI_YU then
        self:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_PER_WITH_SUMMON)
      end
      if self.summonId == nil and self.isBuilding == false then
        self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_HP_LOSS)
        self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543)
        if self.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
          self:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_RANGED_HP_LOSS)
        end
      end
    elseif name == ATTR_ENUM.rage then
      self:DealTriggerSkillAll(TRIGGER_CONDITION.RAGE_NEED)
    end
  end
  
  function unit:ResetBurstSkillFrame()
    self.burstSkillWaitFrame = self.burstSkillCD
  end
  
  function unit:GetHp()
    return self.attrMap[ATTR_ENUM.hp] or 0
  end
  
  function unit:GetRage()
    return self.attrMap[ATTR_ENUM.rage] or 0
  end
  
  function unit:GetSpdAtk()
    local enhanceBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_atk_enhance] or 0
    local enhanceBaseValue = self.attrMap[ATTR_ENUM.spd_atk_enhance] or 0
    local baseValue = self.attrMap[ATTR_ENUM.spd_atk] or 0
    local baseBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_atk] or 0
    local value_enhance = enhanceBaseValue + enhanceBuffValue
    local value_base = baseValue + baseBuffValue
    if value_enhance < 0 then
      return ceil(MathUtil.TruncateFloat(value_base * 10000 / (10000 - value_enhance))), value_base, value_enhance
    elseif value_enhance > 0 then
      return ceil(MathUtil.TruncateFloat(value_base * (10000 + value_enhance) / 10000)), value_base, value_enhance
    end
    return value_base, value_base, value_enhance
  end
  
  function unit:GetSpdMove()
    local enhanceBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_move_enhance] or 0
    local enhanceBaseValue = self.attrMap[ATTR_ENUM.spd_move_enhance] or 0
    local baseValue = self.attrMap[ATTR_ENUM.spd_move] or 0
    local baseBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_move] or 0
    local value_enhance = enhanceBaseValue + enhanceBuffValue
    local value_base = baseValue + baseBuffValue
    if value_enhance < 0 then
      return ceil(MathUtil.TruncateFloat(value_base * 10000 / (10000 - value_enhance))), value_base, value_enhance
    elseif value_enhance > 0 then
      return ceil(MathUtil.TruncateFloat(value_base * (10000 + value_enhance) / 10000)), value_base, value_enhance
    end
    return value_base, value_base, value_enhance
  end
  
  function unit:GetRealtimeAttr(name, realTimeAttrConfig)
    local dependUnit = BattleScene.GetUnitByUid(realTimeAttrConfig.effectDependUnitUid)
    local effectCalType = realTimeAttrConfig.effectCalType
    local finalValue = 0
    if effectCalType == BUFF_EFFECT_VALUE.VALUE then
      finalValue = realTimeAttrConfig.effectCalValue
    elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT and 0 ~= realTimeAttrConfig.effectCalAttrId then
      local attrName = TableData.GetConfig(realTimeAttrConfig.effectCalAttrId, "BaseAttribute").name
      local dependValue
      if realTimeAttrConfig.effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.BASIC then
        dependValue = dependUnit:GetBaseAttr(attrName)
      elseif realTimeAttrConfig.effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.CURRENT then
        dependValue = dependUnit:GetAttr(attrName)
      end
      finalValue = ceil(MathUtil.TruncateFloat(dependValue * realTimeAttrConfig.effectCalValue / 10000))
    end
    finalValue = math.max(finalValue, 0)
    self:SetInitAttr(name, finalValue)
    return finalValue
  end
  
  function unit:GetAttr(name)
    if self.realTimeAttrList[name] then
      return self:GetRealtimeAttr(name, self.realTimeAttrList[name])
    end
    return (self.attrMap[name] or 0) + (self.cachedBuffAttr[name] or 0)
  end
  
  function unit:GetBaseAttr(name)
    return self.attrMap[name] or 0
  end
  
  function unit:GetBuffAttr(name)
    return self.cachedBuffAttr[name] or 0
  end
  
  function unit:UpdateAttrCacheFromBuff(attributeId)
    local value = 0
    local valueMax = 0
    local buff
    local buffUidList = self.buffUidList
    local buffList = BattleBuffMgr.savedBuffList
    local tempValue, maxValue
    for buffUid, enable in pairs(buffUidList) do
      buff = buffList[buffUid]
      tempValue, maxValue = buff:GetAttributeValue(attributeId)
      value = value + tempValue
      valueMax = valueMax + maxValue
    end
    local name = CardAttribute.GetNameById(attributeId)
    local lastValue = self.cachedBuffAttr[name]
    self.cachedBuffAttr[name] = value
    if attributeId == ATTR_ID.TENACITY then
      self.tenacityMax = valueMax
      if lastValue and lastValue > 0 and value <= 0 then
        BattleBuffMgr.TriggerUnitListener(self, BUFF_DEDUCE_TYPE.TENACITY_END)
      end
    elseif attributeId == ATTR_ID.SHIELD_SPECIAL then
      if BattleBuffMgr.ContainEffectId(self, BUFF_EFFECT_ID.SHIELD_SPECIAL) == false then
        self:ClearMaxSpecialShield()
      end
    elseif attributeId == ATTR_ID.SHIELD and lastValue and lastValue > 0 and value <= 0 then
      BattleBuffMgr.TriggerUnitListener(self, BUFF_DEDUCE_TYPE.SHIELD_END)
    end
  end
  
  function unit:AddMaxSpecialShield(value)
    self.shieldSpecialMax = self.shieldSpecialMax + value
  end
  
  function unit:ClearMaxSpecialShield()
    self.shieldSpecialMax = 0
  end
  
  function unit:UpdateCachedBuffEffect()
    local cachedBuffEffect, cachedBuffControlType, cachedBuffEffectTag = {}, {}, {}
    local buffUidList = self.buffUidList
    local buffUidArray = table.mapKey2Array(buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    local effectId, buff, controlTypeList, effectList, temp, effectTags, effect
    local buffList = BattleBuffMgr.savedBuffList
    for _, buffUid in ipairs(buffUidArray) do
      buff = buffList[buffUid]
      effectList = buff.effectList
      for i = 1, #effectList do
        effect = effectList[i]
        effectId = effect.effectId
        temp = cachedBuffEffect[effectId]
        if nil == temp then
          temp = {}
        end
        controlTypeList = effect.controlType
        for _, type in ipairs(controlTypeList) do
          cachedBuffControlType[type] = 1
        end
        effectTags = effect.effectTags
        for _, tag in ipairs(effectTags) do
          cachedBuffEffectTag[tag] = 1
        end
        temp[#temp + 1] = effect
        cachedBuffEffect[effectId] = temp
      end
    end
    self.cachedBuffEffect = cachedBuffEffect
    self.cachedBuffControlType = cachedBuffControlType
    self.cachedBuffEffectTag = cachedBuffEffectTag
    if BattleMgr.isBattleServer == false then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {unit = self})
    end
  end
  
  function unit:UpdateBuffDeduceValue(buffId, value)
    local buff
    local buffList = BattleBuffMgr.savedBuffList
    local buffUidList = self.buffUidList
    local buffUidArray = table.mapKey2Array(buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, buffUid in ipairs(buffUidArray) do
      buff = buffList[buffUid]
      if buff.id == buffId then
        buff:UpdateDeduceValue(value)
      end
    end
  end
  
  function unit:GetEffectTotalValue(effectId)
    local value = 0
    if self.cachedBuffEffect[effectId] then
      local effectList = self.cachedBuffEffect[effectId]
      for i, v in ipairs(effectList) do
        value = value + v.finalValue
      end
    end
    return value
  end
  
  function unit:UpdateBuffIcon()
    if self.messageBar then
      self.messageBar:UpdateBuffList(self)
    end
  end
  
  function unit:GetBuffIconList()
    local iconList = {}
    local tempEffectCount = {}
    local tempBuffEffect, tempEffect, buff, iconPath, sort, effectId, count, remainFrame, totalFrame, effectList, effect
    local buffUidList = self.buffUidList
    local savedBuffList = BattleBuffMgr.savedBuffList
    for buffUid, enable in pairs(buffUidList) do
      buff = savedBuffList[buffUid]
      if buff.needShowBuffIcon == true then
        tempBuffEffect = tempEffectCount[buff.id] or {}
        effectList = buff.effectList
        for i = 1, #effectList do
          effect = effectList[i]
          if true == effect.needShowIcon then
            iconPath = effect.effectConfig.icon_path
            sort = effect.effectConfig.icon_priority
            effectId = effect.effectId
            if nil == tempBuffEffect[effectId] then
              local effectConfig = TableData.GetConfig(effectId, "BaseSkillBuffEffect")
              tempBuffEffect[effectId] = {
                buffId = buff.id,
                count = buff.overlayNum or 1,
                buffUids = {buffUid},
                showType = effectConfig.show_type,
                deduceType = buff.deduceType,
                remainFrames = buff.remainFrames,
                remainMaxFrames = buff.remainMaxFrames,
                iconPath = iconPath,
                sort = sort
              }
            else
              tempEffect = tempBuffEffect[effectId]
              local buffUids = tempEffect.buffUids
              local isContain = false
              for i, v in ipairs(buffUids) do
                if v == buffUid then
                  isContain = true
                  break
                end
              end
              if false == isContain then
                tempEffect.count = tempEffect.count + 1
                table.insert(tempEffect.buffUids, buffUid)
                if buff.remainFrames and buff.remainMaxFrames then
                  tempEffect.remainFrames = math.min(tempEffect.remainFrames, buff.remainFrames)
                end
              end
            end
          end
        end
        tempEffectCount[buff.id] = tempBuffEffect
      end
    end
    for _, buffEffect in pairs(tempEffectCount) do
      for _, temp in pairs(buffEffect) do
        iconList[#iconList + 1] = SimpleCopy(temp)
      end
    end
    table.sort(iconList, function(a, b)
      if a.sort == b.sort then
        return a.buffId < b.buffId
      else
        return a.sort < b.sort
      end
    end)
    return iconList
  end
  
  function unit:UpdateActionSpeed()
    local atkSpeed = self:GetSpdAtk()
    if 0 == atkSpeed then
      return
    end
    if self.savedAtkSpeed ~= atkSpeed then
      self.savedAtkSpeed = atkSpeed
      local defaultSpeed
      local curTotalFrame = ceil(MathUtil.TruncateFloat(atkSpeed * BATTLE_CONFIG_ENUM.FIXED_FPS / 1000))
      if self.defaultNormalSkillTotalFrame == nil then
        local showConfig = self:GetNormalSkillShowConfig()
        local configTotalFrame = showConfig.total_f
        local configInterval = self:GetDefaultWaitFrame()
        self.defaultNormalSkillTotalFrame = ceil(MathUtil.TruncateFloat(curTotalFrame * configTotalFrame / (configTotalFrame + configInterval)))
        self.defaultNormalSkillInterval = curTotalFrame - self.defaultNormalSkillTotalFrame
        self.defaultStartInterval = self:GetStartWaitFrame()
        self.curStartInterval = self.defaultStartInterval
        local attackTotalFrame = self.defaultNormalSkillInterval + self.defaultNormalSkillTotalFrame
        defaultSpeed = ceil(MathUtil.TruncateFloat(1000 * attackTotalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS))
        self.defaultAttackSpeed = MathUtil.TruncateFloat(self.defaultNormalSkillTotalFrame / configTotalFrame)
      end
      if curTotalFrame >= self.defaultNormalSkillTotalFrame then
        self.curNormalSkillInterval = curTotalFrame - self.defaultNormalSkillTotalFrame
        self.curNormalSkillTotalFrame = self.defaultNormalSkillTotalFrame
        self.attackFrameScale = self.defaultAttackSpeed * 10000
      else
        self.curNormalSkillInterval = 0
        self.curNormalSkillTotalFrame = curTotalFrame
        self.attackFrameScale = self.defaultAttackSpeed * 10000 * MathUtil.TruncateFloat(self.curNormalSkillTotalFrame / self.defaultNormalSkillTotalFrame)
      end
      print_battle("攻击速度变化：", self.positionIndex, "atkSpeed", atkSpeed, "当前间隔", self.curNormalSkillInterval, "当前技能帧数", self.curNormalSkillTotalFrame)
    end
  end
  
  function unit:UpdateMoveSpeed()
    local moveSpeed = self:GetSpdMove()
    if 0 == moveSpeed then
      return
    end
    if self.saveMoveSpeed ~= moveSpeed then
      self.saveMoveSpeed = moveSpeed
      print_battle("移动速度变化：", self.positionIndex, "moveSpeed", moveSpeed)
    end
  end
  
  function unit:UpdateTrapBuff(buffDeduceType, triggerTrapUid)
    if self.buildingType ~= BATTLE_BUILDING_TYPE.TRAP_TRIGGER then
      return
    end
    local buff
    local buffUidList = self.buffUidList
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, uid in ipairs(buffUidArray) do
      buff = savedBuffList[uid]
      if buff and buff.deduceType == buffDeduceType then
        self.triggerTrapUid = triggerTrapUid
        buff:Deduce()
      end
    end
  end
  
  function unit:GetLastFrameBySkillId(skillId)
    local triggerSkillList = self.savedTriggerSkillList
    local skillTriggerInfo
    local len = #triggerSkillList
    for i = len, 1, -1 do
      skillTriggerInfo = triggerSkillList[i]
      if skillTriggerInfo.id == skillId then
        return skillTriggerInfo.frame
      end
    end
    return 0
  end
  
  function unit:GetNormalSkillCountSinceLastSkill(skillId)
    local triggerSkillList = self.savedTriggerSkillList
    local count = 0
    if #triggerSkillList > 0 then
      local normalSkillId = self:GetBaseCardOrMonsterConfig().normal_skill
      local skillTriggerInfo
      local len = #triggerSkillList
      for i = len, 1, -1 do
        skillTriggerInfo = triggerSkillList[i]
        if skillTriggerInfo.id == skillId then
          break
        end
        if skillTriggerInfo.id == normalSkillId then
          count = count + 1
        end
      end
    end
    return count
  end
  
  function unit:GetSkillLevelUpTriggerParam(skillId, skillLevelUpConfig, specificCondition)
    local condition, triggerValue, triggerType, triggerRandom
    local triggerCount = self:GetSkillAlreadyTriggerCount(skillId)
    local index = triggerCount + 1
    local conditionList, triggerValueList, triggerTypeList, triggerRandomList
    if skillLevelUpConfig.trigger_condition_2 then
      for i = 1, 2 do
        conditionList = skillLevelUpConfig["trigger_condition_" .. i]
        if conditionList then
          condition = conditionList[index] or conditionList[#conditionList]
          if condition == specificCondition then
            triggerValueList = skillLevelUpConfig["trigger_value_" .. i]
            triggerTypeList = skillLevelUpConfig["trigger_type_" .. i]
            triggerRandomList = skillLevelUpConfig["trigger_random_" .. i]
            triggerValue = triggerValueList and (triggerValueList[index] or triggerValueList[#triggerValueList])
            triggerType = triggerTypeList and (triggerTypeList[index] or triggerTypeList[#triggerTypeList])
            triggerRandom = triggerRandomList and (triggerRandomList[index] or triggerRandomList[#triggerRandomList])
            return condition, triggerValue, triggerType, triggerCount, triggerRandom
          end
        end
      end
    else
      conditionList = skillLevelUpConfig.trigger_condition_1
      if conditionList then
        condition = conditionList[index] or conditionList[#conditionList]
        if condition == specificCondition then
          triggerValueList = skillLevelUpConfig.trigger_value_1
          triggerTypeList = skillLevelUpConfig.trigger_type_1
          triggerRandomList = skillLevelUpConfig.trigger_random_1
          triggerValue = triggerValueList and (triggerValueList[index] or triggerValueList[#triggerValueList])
          triggerType = triggerTypeList and (triggerTypeList[index] or triggerTypeList[#triggerTypeList])
          triggerRandom = triggerRandomList and (triggerRandomList[index] or triggerRandomList[#triggerRandomList])
          return condition, triggerValue, triggerType, triggerCount, triggerRandom
        end
      end
    end
  end
  
  function unit:GetSkillAlreadyTriggerCount(skillId)
    local count = 0
    local triggerSkillList = self.savedTriggerSkillList
    local skillTriggerInfo, lastTriggerFrame
    local len = #triggerSkillList
    for i = len, 1, -1 do
      skillTriggerInfo = triggerSkillList[i]
      if skillTriggerInfo.id == skillId then
        if nil == lastTriggerFrame then
          lastTriggerFrame = skillTriggerInfo.frame
        end
        count = count + 1
      end
    end
    return count, lastTriggerFrame
  end
  
  function unit:SaveTriggerSkill(skillInfo)
    local skillId = skillInfo and skillInfo.id or self.curSkill.id
    local skillType = skillInfo and skillInfo.type or self.curSkill.type
    local savedTriggerSkillList = self.savedTriggerSkillList
    local _, showId = self:GetSkillShowConfig(skillId)
    savedTriggerSkillList[#savedTriggerSkillList + 1] = {
      id = skillId,
      type = skillType,
      frame = BattleControl.curFixedFrame,
      triggerFromBuff = skillInfo.triggerFromBuff,
      showId = showId,
      level = self:GetSkillLevel(skillId)
    }
  end
  
  function unit:GetName()
    local name = self:GetBaseConfig().name
    return name and name()
  end
  
  function unit:AddBuff(uid, buffContainIcon)
    self.buffUidList[uid] = 1
    if buffContainIcon or self.buffRefreshCurFrame then
      self.buffRefreshCurFrame = true
    end
    self:UpdateCachedBuffEffect()
  end
  
  function unit:RemoveBuff(uid, buffContainIcon)
    self.buffUidList[uid] = nil
    if buffContainIcon or self.buffRefreshCurFrame then
      self.buffRefreshCurFrame = true
    end
    self:UpdateCachedBuffEffect()
  end
  
  function unit:UpdateCurMotionState()
    if self.model == nil then
      return
    end
    local list = self.motionStateList
    local v
    for i = #list, 1, -1 do
      v = list[i]
      if v.frame > 1 then
        v.frame = v.frame - 1
      elseif 1 == v.frame then
        table.remove(list, i)
      end
    end
    if #self.motionStateList > 0 then
      local id = self.motionStateList[1].motionId
      if id == self.curMotion then
        return
      end
      self.curMotion = id
      SkeletonAnimationUtil.SetSkin(self.model, id)
    else
      if self.curMotion == defaultMotion then
        return
      end
      self.curMotion = defaultMotion
      SkeletonAnimationUtil.SetSkin(self.model, defaultMotion)
    end
  end
  
  function unit:AddMotionState(state)
    if self.model == nil then
      return
    end
    local exsistState
    local list = self.motionStateList
    for i, v in ipairs(list) do
      if v.state == state then
        exsistState = v
        break
      end
    end
    if nil == exsistState then
      local baseStateInfo = BATTLE_MOTION_STATE_INFO[state]
      local motionIdList = baseStateInfo.motion_id
      local motionId
      if #motionIdList > 1 then
        motionId = motionIdList[math.random(1, #motionIdList)]
      else
        motionId = motionIdList[1]
      end
      table.insert(list, {
        state = state,
        motionId = motionId,
        frame = math.floor(baseStateInfo.duration * Application.targetFrameRate),
        priority = baseStateInfo.priority
      })
      table.sort(list, function(a, b)
        return a.priority > b.priority
      end)
    end
  end
  
  function unit:RemoveMotionState(state)
    if self.model == nil then
      return
    end
    local list = self.motionStateList
    for i, v in ipairs(list) do
      if v.state == state then
        table.remove(list, i)
        return
      end
    end
  end
  
  function unit:RemoveClearMotionState()
    if self.model == nil then
      return
    end
    self.motionStateList = {}
  end
  
  function unit:SetStun(isStun)
    if self.isStun == false and true == isStun then
      if false == self:CanBuffChosen() then
        return
      end
      self.isStun = true
      BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STUN, true)
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.STUN)
      print_battle("眩晕 ", self.positionIndex)
    elseif self.isStun == true and false == isStun then
      print_battle("解除眩晕 ", self.positionIndex)
      self.isStun = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.STUN)
      if self.curState ~= BATTLE_STATE_ENUM.PERSIST_CAST and self:IsAlive() then
        self:SetState(BATTLE_STATE_ENUM.STAND, true)
      end
    end
  end
  
  function unit:SetFreeze(isFreeze)
    if self.isFreeze == false and true == isFreeze then
      if false == self:CanBuffChosen() then
        return
      end
      print_battle("冰冻")
      self.isFreeze = true
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.FREEZE)
    elseif self.isFreeze == true and false == isFreeze then
      print_battle("解除冰冻")
      self.isFreeze = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.FREEZE)
    end
  end
  
  function unit:SetStealth(isStealth)
    if self.isStealth == false and true == isStealth then
      if false == self:CanBuffChosen() then
        return
      end
      print_battle("潜行")
      self.isStealth = true
    elseif self.isStealth == true and false == isStealth then
      print_battle("解除潜行")
      self.isStealth = false
    end
  end
  
  function unit:SetTimePause(isTimePause)
    if true == isTimePause then
      local camp = BattleScene.GetCampObject(self.enemyCamp)
      if camp then
        camp:AddTimePause()
      end
    end
    if self.isTimePause == false and true == isTimePause then
      if false == self:CanBuffChosen() then
        return
      end
      print_battle("时停")
      self.isTimePause = true
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.FREEZE)
    elseif true == self.isTimePause and false == isTimePause then
      print_battle("解除时停")
      self.isTimePause = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.FREEZE)
    end
  end
  
  function unit:SetPetrified(isPetrified)
    if self.isPetrified == false and true == isPetrified then
      if false == self:CanBuffChosen() then
        return
      end
      print_battle("石化")
      self.isPetrified = true
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.PETRIFIED)
    elseif self.isPetrified == true and false == isPetrified then
      print_battle("解除石化")
      self.isPetrified = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.PETRIFIED)
    end
  end
  
  function unit:SetSilent(isSilent)
    if self:CanBuffChosen() == false then
      return
    end
    self.isSilent = isSilent
    if isSilent then
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.SILENT)
    else
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.SILENT)
    end
  end
  
  function unit:SetCharm(isCharm)
    if self.isCharm == false and true == isCharm then
      local charmTargetUnit = BattleChoose.GetNearestUnit(self, true, nil, 1, false, true)
      if #charmTargetUnit > 0 then
        self.isCharm = true
        self:SetCharmUid(charmTargetUnit[1].uid)
        self:AddMotionState(BATTLE_MOTION_STATE_ENUM.CHARM)
      end
    end
    if self.isCharm == true and false == isCharm then
      self.isCharm = false
      self:SetCharmUid(nil)
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.CHARM)
    end
  end
  
  function unit:SetPersistCast(isPersistCast)
    if self.isPersistCast == false and true == isPersistCast then
      print_battle("持续施法状态 ", self.positionIndex)
      self.isPersistCast = true
      BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.PERSIST_CAST, true)
    end
    if self.isPersistCast == true and false == isPersistCast then
      print_battle("解除持续施法状态 ", self.positionIndex)
      self.isPersistCast = false
      if self:IsAlive() then
        self:SetState(BATTLE_STATE_ENUM.STAND, true)
      end
    end
  end
  
  function unit:SetDefense(isDefense)
    if self.isDefense == false and true == isDefense then
      print_battle("防御状态 ", self.positionIndex)
      self.isDefense = true
    end
    if self.isDefense == true and false == isDefense then
      print_battle("解除防御状态 ", self.positionIndex)
      self.isDefense = false
      if self:IsAlive() then
        self:SetState(BATTLE_STATE_ENUM.STAND, true)
      end
    end
  end
  
  function unit:SetBlind(isBlind)
    if self.isBlind == false and true == isBlind then
      self.isBlind = true
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.BLIND)
    end
    if self.isBlind == true and false == isBlind then
      self.isBlind = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.BLIND)
    end
  end
  
  function unit:SetFear(isFear, buff)
    if self.isFear == false and true == isFear then
      self.isFear = true
      BattleAction.InitFearUnitData(self, buff.buffConfig)
      BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.FEAR, true)
      self:AddMotionState(BATTLE_MOTION_STATE_ENUM.BLIND)
    end
    if self.isFear == true and false == isFear then
      self.isFear = false
      self:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.BLIND)
      if self:IsAlive() and self.curState == BATTLE_STATE_ENUM.FEAR then
        self:SetState(BATTLE_STATE_ENUM.STAND, true)
      end
    end
  end
  
  function unit:SetTrick(isTrick)
    if self.isTrick == false and true == isTrick then
      print_battle("诱骗状态 ", self.positionIndex)
      self.isTrick = true
      if true == self:CanMove() then
        BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.MOVE, true)
      end
    end
    if self.isTrick == true and false == isTrick then
      print_battle("解除诱骗状态 ", self.positionIndex)
      self.isTrick = false
      if self:IsAlive() then
        self:SetState(BATTLE_STATE_ENUM.STAND, true)
      end
    end
  end
  
  function unit:SetUnableToSelect(unableToSelect)
    if self.unableToSelect == false and true == unableToSelect then
      print_battle("无法被选中 ", self.positionIndex)
      self.unableToSelect = true
    end
    if self.unableToSelect == true and false == unableToSelect then
      print_battle("解除 无法被选中 ", self.positionIndex)
      self.unableToSelect = false
    end
  end
  
  function unit:SetGhost(ghostEnable)
  end
  
  function unit:ClearControlStateWhenTransform()
    local forceControlEffectIdList = BattleBuffMgr.GetForceControlEffectIdList()
    for _, effectId in ipairs(forceControlEffectIdList) do
      local count, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(self, effectId, function(array)
        table.sort(array, function(a, b)
          return a.uid > b.uid
        end)
      end)
      if count > 0 then
        for _, buff in ipairs(buffTable) do
          buff:Remove()
        end
      end
    end
  end
  
  function unit:ClearControlState()
    self:SetStun(false)
    self:SetFreeze(false)
    self:SetTimePause(false)
    self:SetSilent(false)
    self:SetCharm(false)
    self:SetPersistCast(false)
    self:SetTrick(false)
    self:SetBlind(false)
  end
  
  function unit:SetBeAttractedUid(beAttractedUid)
    if beAttractedUid then
      local curAttackTargetUid = self:GetAttackTargetUid()
      print_battle("设置嘲讽目标", beAttractedUid, "原来目标", curAttackTargetUid, self.positionIndex, self.curState)
      self.beAttractedUid = beAttractedUid
      if beAttractedUid ~= curAttackTargetUid and (self.curState == BATTLE_STATE_ENUM.ATTACK or self.curState == BATTLE_STATE_ENUM.ATTACK_OVER) then
        BattleAction.ForceChangeState(self, nil, true)
      else
      end
    elseif self.beAttractedUid then
      local tempUid = self.beAttractedUid
      self.beAttractedUid = nil
      local curAttackTargetUid = self:GetAttackTargetUid()
      print_battle("清除嘲讽目标 ,新目标", curAttackTargetUid, self.positionIndex, self.curState)
      if self.curState == BATTLE_STATE_ENUM.ATTACK or self.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
        self.delayCancelBeAttractTargetUid = tempUid
        print_battle("清除嘲讽目标 ,不打断攻击,暂存当前攻击目标", self.delayCancelBeAttractTargetUid)
      elseif self:IsAlive() then
        BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
      end
    end
  end
  
  function unit:SetCharmUid(charmUid)
    if charmUid then
      local curAttackTargetUid = self:GetAttackTargetUid()
      print_battle("设置魅惑目标", charmUid, "原来目标", curAttackTargetUid, self.positionIndex, self.curState)
      self.charmUid = charmUid
      if charmUid ~= curAttackTargetUid and (self.curState == BATTLE_STATE_ENUM.ATTACK or self.curState == BATTLE_STATE_ENUM.ATTACK_OVER) then
        BattleAction.ForceChangeState(self, nil, true)
      else
      end
    elseif self.charmUid then
      self.charmUid = nil
      local curAttackTargetUid = self:GetAttackTargetUid()
      print_battle("清除魅惑目标 ,新目标", curAttackTargetUid, self.positionIndex, self.curState)
      BattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.STAND)
    end
  end
  
  function unit:ChangeHpAdaptToMax(isClear)
    local maxHpName = ATTR_ENUM.max_hp
    local curMaxHp = self:GetAttr(maxHpName)
    local value
    if isClear then
      value = math.max(floor(curMaxHp * self.lastHpPer), 1)
    else
      value = ceil(curMaxHp * self.lastHpPer)
    end
    self:SetInitAttr(ATTR_ENUM.hp, value)
    self.lastHpPer = nil
  end
  
  function unit:OnBuffAttrChanged(attributeId, value)
    if self:IsDead() == true or true == self:IsDestroy() then
      return
    end
    if attributeId == ATTR_ID.SPD_ATK_ENHANCE then
      self:UpdateActionSpeed()
    elseif attributeId == ATTR_ID.SPD_MOVE_ENHANCE then
      self:UpdateMoveSpeed()
    elseif attributeId == ATTR_ID.SHIELD or attributeId == ATTR_ID.TENACITY or attributeId == ATTR_ID.SHIELD_SPECIAL then
      if self.messageBar then
        self.messageBar:UpdateHp(self)
      end
    elseif attributeId == ATTR_ID.MAX_HP then
      self:ChangeHpAdaptToMax()
      self:UpdateTempHpPerAndMessageBar()
    elseif attributeId == ATTR_ID.RAGE then
      if self.messageBar then
        self.messageBar:UpdateRage(self)
      end
    elseif attributeId == ATTR_ID.RANGE_ATK then
      self.tempRangeAtk = self:GetAttr(ATTR_ENUM.range_atk)
    end
  end
  
  function unit:UpdateTempHpPerAndMessageBar()
    self:UpdateTempHpPer()
    if self.messageBar then
      self.messageBar:UpdateHp(self)
    end
  end
  
  function unit:UpdateTempHpPer()
    local lastPer = self.tempHpPer
    self.tempHpPer = MathUtil.TruncateFloatN(self:GetHp() / self:GetAttr(ATTR_ENUM.max_hp), 8)
    if lastPer then
      if lastPer > 0.5 and self.tempHpPer <= 0.5 then
        BattleBuffMgr.TriggerUnitListener(self, BUFF_DEDUCE_TYPE.HP_PER_LESS_50)
      elseif lastPer <= 0.5 and self.tempHpPer > 0.5 then
        BattleBuffMgr.TriggerUnitListener(self, BUFF_DEDUCE_TYPE.HP_PER_MORE_50)
      end
    end
  end
  
  function unit:GetTargetUidList()
    if #self.skillTargetUidList > 0 then
      return self.skillTargetUidList
    else
      local attackUid = self:GetAttackTargetUid()
      return {attackUid}
    end
  end
  
  function unit:GetAttackTargetUid()
    if self.beAttractedUid ~= nil then
      return self.beAttractedUid, true
    end
    if nil ~= self.delayCancelBeAttractTargetUid then
      return self.delayCancelBeAttractTargetUid
    end
    if nil ~= self.charmUid then
      return self.charmUid, nil, true
    end
    return self.attackTargetUid
  end
  
  function unit:GetMoveTargetUid()
    if self.beAttractedUid ~= nil then
      return self.beAttractedUid, true
    end
    if nil ~= self.charmUid then
      return self.charmUid, nil, true
    end
    return self.moveTargetUid
  end
  
  function unit:SetAttackTargetUid(attackTargetUid)
    local changeTarget = false
    if self.lastAttackTargetUid ~= attackTargetUid then
      changeTarget = true
    end
    self.lastAttackTargetUid = attackTargetUid
    if self.beAttractedUid == nil and nil == self.charmUid then
      self.attackTargetUid = attackTargetUid
    end
    if nil ~= attackTargetUid and true == changeTarget then
      local normalSkillShowConfig = self:GetNormalSkillShowConfig()
      if normalSkillShowConfig then
        local id = normalSkillShowConfig.id
        local cachedInfo = self.cachedSkillShowDisplayInfos[id]
        if cachedInfo then
          cachedInfo.curIndex = nil
        end
      end
      self:DealTriggerSkillAll(TRIGGER_CONDITION.CHANGE_ATTACK_TARGET)
    end
  end
  
  function unit:ForceChangeAttackTarget(targetUnit)
    if self.attackTargetUid ~= targetUnit.uid then
      self.moveTargetUid = targetUnit.uid
      self.attackTargetUid = targetUnit.uid
      if self.curState == BATTLE_STATE_ENUM.ATTACK or self.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
        BattleAction.ForceChangeState(self, nil, true)
      end
    end
  end
  
  function unit:SetMoveTargetUid(moveTargetUid)
    if self.beAttractedUid == nil and nil == self.charmUid then
      self.moveTargetUid = moveTargetUid
    end
  end
  
  function unit:SaveSkillDamageForTestBalance(damage, skillType, isSummon)
    if BattleMgr.isTestBalance ~= true then
      return
    end
    if damage > 0 then
      if self.summonId then
        if self.summonFromUnit then
          local summonUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
          summonUnit:SaveSkillDamageForTestBalance(damage, skillType, true)
        end
        return
      end
      if isSummon then
        self.summonDamage = self.summonDamage + damage
        return
      end
      if skillType == BATTLE_SKILL_ENUM.NORMAL then
        self:SaveNormalSkillDamage(damage)
        local burst = BattleScene.GetBurst(self.camp)
        if burst and burst.energySkillRemainFrame ~= nil then
          self.normalSkillDamageInBurst = self.normalSkillDamageInBurst + damage
        else
          self.normalSkillDamageOutBurst = self.normalSkillDamageOutBurst + damage
        end
      elseif skillType == BATTLE_SKILL_ENUM.SMALL then
        self:SaveSmallSkillDamage(damage)
      elseif skillType == BATTLE_SKILL_ENUM.UNIQUE then
        self:SaveUniqueSkillDamage(damage)
      elseif skillType == BATTLE_SKILL_ENUM.BURST_CARD then
        self:SaveBurstSkillDamage(damage)
      else
        self:SaveBuffDamage(damage)
      end
    end
  end
  
  function unit:SaveNormalSkillDamage(damage)
    self.normalSkillDamage = self.normalSkillDamage + damage
  end
  
  function unit:SaveSmallSkillDamage(damage)
    self.smallSkillDamage = self.smallSkillDamage + damage
  end
  
  function unit:SaveUniqueSkillDamage(damage)
    self.uniqueSkillDamage = self.uniqueSkillDamage + damage
  end
  
  function unit:SaveBurstSkillDamage(damage)
    self.burstSkillDamage = self.burstSkillDamage + damage
  end
  
  function unit:SaveBuffDamage(damage)
    self.buffDamage = self.buffDamage + damage
  end
  
  function unit:SaveDamage(damage)
    if self.summonId then
      if self.summonFromUnit then
        local summonUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
        summonUnit:SaveDamage(damage)
      end
      return
    end
    if damage > 0 then
      self.damageRecord = self.damageRecord + damage
      if self.camp == BATTLE_CAMP_FLAG.LEFT then
        BattleData.leftTotalDamage = BattleData.leftTotalDamage + damage
      end
    elseif damage < 0 then
      self.treatRecord = self.treatRecord - damage
    end
  end
  
  function unit:SaveDamaged(damage, fromOther, fromSummon)
    if self.summonId and self.summonFromUnit then
      local summonUnit = BattleScene.GetUnitByUid(self.summonFromUnit)
      if summonUnit.isBuilding == false then
        summonUnit:SaveDamaged(damage, fromOther, true)
        return
      end
    end
    if damage > 0 then
      self.damagedRecord = self.damagedRecord + damage
      if BattleData.scoreInfo and self.camp == BATTLE_CAMP_FLAG.RIGHT and self.monsterRank >= 3 then
        BattleData.UpdateBattleScore(nil, damage)
      end
      if damage > 0 and self.isBuilding == false and self.summonId == nil and true ~= fromSummon then
        BattleCamp.DealCampCharge(self.camp, damage)
      end
    elseif damage < 0 then
      self.treatedRecord = self.treatedRecord - damage
      if true == fromOther then
        self.treatedFromOther = self.treatedFromOther - damage
      end
      self.treatedTemp_1 = self.treatedTemp_1 - damage
    end
  end
  
  function unit:SetMoveToPosition(position)
    self.moveToPosition = position
  end
  
  unit:Init()
  return unit
end
