BattleAction = {}
local sqrt = math.sqrt
local t_insert = table.insert
local floor = math.floor
local ceil = math.ceil
local tonumber = tonumber
local BATTLE_STATE_ENUM = BATTLE_STATE_ENUM
local TRIGGER_CONDITION = TRIGGER_CONDITION
local BUFF_DEDUCE_TYPE = BUFF_DEDUCE_TYPE
local BUFF_SETTLE_TYPE = BUFF_SETTLE_TYPE
local ATTR_ENUM = ATTR_ENUM
local BUFF_EFFECT_ID = BUFF_EFFECT_ID
local BUFF_CONTROL_TYPE = BUFF_CONTROL_TYPE
local BATTLE_CONFIG_ENUM = BATTLE_CONFIG_ENUM
local BATTLE_CAMP_FLAG = BATTLE_CAMP_FLAG
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE
local BATTLE_SKILL_ENUM = SKILL_TYPE_ENUM
local HURT_NUM_ENUM = HURT_NUM_ENUM
local Split = Split
local CompareNum = CompareNum

function BattleAction.InitLocalVar()
end

function BattleAction.DealPreBattle()
  local allUnit = BattleScene.GetAllUnit()
  for i = 1, #allUnit do
    BattleAction.DealUnitBasicBuff(allUnit[i])
  end
end

function BattleAction.DealBuffPre()
  local buffList = BattleData.buffList
  local preBuffConfig, buffId, targetId, buffConfig, preBuffId, count, maxBuffIndex
  if BattleMgr.isBattleServer == true then
    maxBuffIndex = #buffList
  else
    maxBuffIndex = math.min(BattleControl.dealBuffPreCount + 5, #buffList)
  end
  for i = BattleControl.dealBuffPreCount + 1, maxBuffIndex do
    local buffData = buffList[i]
    preBuffId = buffData.preBuffId
    preBuffConfig = TableData.GetConfig(preBuffId, "BaseSkillBuffPre")
    if 1 == preBuffConfig.buff_overlay then
      count = buffData.count
    else
      count = nil
    end
    buffId = preBuffConfig.buff
    if buffId then
      buffConfig = TableData.GetConfig(buffId, "BaseSkillBuff")
      targetId = preBuffConfig.target
      local baseCamp = BATTLE_CAMP_FLAG.LEFT
      if BattleData.isMirror then
        baseCamp = BATTLE_CAMP_FLAG.RIGHT
      end
      local unitList, camp = BattleChoose.GetBuffTargetUnitList({camp = baseCamp}, {}, targetId, buffConfig)
      if camp then
        BattleBuffMgr.NewBuff(buffId, {camp = baseCamp}, {camp = camp}, true, {triggerFromPreBuffId = preBuffId, deduceCountWhenSettled = count})
      else
        for index = 1, #unitList do
          BattleBuffMgr.NewBuff(buffId, {}, {
            unitUid = unitList[index].uid
          }, true, {triggerFromPreBuffId = preBuffId, deduceCountWhenSettled = count})
        end
      end
    end
    BattleControl.dealBuffPreCount = BattleControl.dealBuffPreCount + 1
  end
  if BattleControl.dealBuffPreCount >= #buffList then
    BattleControl.battleStartEnable = true
  end
end

function BattleAction.DealUnitBasicBuff(battleUnit)
  local uid = battleUnit.uid
  local baseConfig = battleUnit:GetBaseCardOrMonsterConfig()
  if baseConfig then
    local basicBuff = baseConfig.basic_buff
    if basicBuff then
      for i = 1, #basicBuff do
        BattleBuffMgr.NewBuff(basicBuff[i], {unitUid = uid}, {unitUid = uid}, true)
      end
    end
  end
  if battleUnit.isBuilding then
    baseConfig = battleUnit:GetBaseConfig()
    local basicBuff = baseConfig.basic_buff
    if basicBuff then
      for i = 1, #basicBuff do
        local buff = BattleBuffMgr.NewBuff(basicBuff[i], {unitUid = uid}, {unitUid = uid}, true)
        buff.destroyUnitWhenRemove = true
      end
    end
  end
  local badgeSuitBuffList = battleUnit.badgeSuitBuffList
  for _, buffId in ipairs(badgeSuitBuffList) do
    BattleBuffMgr.NewBuff(buffId, {unitUid = uid}, {unitUid = uid}, true)
  end
end

function BattleAction.DealStart(battleUnit)
  if battleUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
    battleUnit:ChooseMoveTarget(true)
  end
  local triggerConfigBattleStart = TRIGGER_CONDITION.BATTLE_START
  local skillList = battleUnit.passiveSkillTriggerTable[triggerConfigBattleStart]
  if nil ~= skillList then
    BattleAction.DealTriggerPassiveSkill(battleUnit, triggerConfigBattleStart, skillList)
  end
  BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BATTLE_START, BUFF_SETTLE_TYPE.BATTLE_START)
  skillList = battleUnit.otherSkillTriggerTable[triggerConfigBattleStart]
  if nil ~= skillList then
    BattleAction.DealTriggerSkill(battleUnit, triggerConfigBattleStart, skillList)
  end
  if battleUnit.curState == BATTLE_STATE_ENUM.START then
    battleUnit:SetState(BATTLE_STATE_ENUM.STAND)
  end
end

function BattleAction.DealStand(battleUnit)
  if battleUnit.isTrick == true then
    return
  end
  if battleUnit.canMoveOrAttack == false then
    return
  end
  local target, changeToAttack, moveFront = battleUnit:ChooseMoveTarget()
  if target and changeToAttack then
    battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.FIRST_ATTACK)
  end
  if battleUnit.curState ~= BATTLE_STATE_ENUM.STAND then
    return
  end
  if target and true == changeToAttack then
    BattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.WAIT_ATTACK)
  else
    if true == battleUnit.isBuilding or battleUnit.saveMoveSpeed == nil then
      return
    end
    if false == battleUnit:CanMove() then
      return
    end
    if target or moveFront then
      battleUnit:SetState(BATTLE_STATE_ENUM.MOVE)
    end
  end
end

function BattleAction.DealTrick(battleUnit)
  if battleUnit:CanMove() == false then
    return
  end
  local _, _, buffs = BattleBuffMgr.GetContainedEffect(battleUnit, BUFF_EFFECT_ID.TRICK, nil, true)
  if #buffs > 0 then
    local buff = buffs[1]
    local fromUnitUid = buff.fromUnitUid
    local fromUnit = BattleScene.GetUnitByUid(fromUnitUid)
    local dis = fromUnit.cachedDistance[battleUnit.uid]
    if dis > 50 then
      local trickSpeed = MathUtil.TruncateFloat(100 / BATTLE_CONFIG_ENUM.FIXED_FPS)
      battleUnit.speed = BattleScene.GetSpeed(battleUnit.position, fromUnit.position, math.min(dis, trickSpeed))
    elseif battleUnit.curState == BATTLE_STATE_ENUM.MOVE then
      BattleAction.ForceChangeState(battleUnit)
    end
  end
end

function BattleAction.DealMove(battleUnit)
  if battleUnit.moveToPosition then
    battleUnit.speed = BattleScene.GetSpeed(battleUnit.position, battleUnit.moveToPosition, MathUtil.TruncateFloat(battleUnit:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS), nil, true)
    if 0 == MathUtil.GetVector3Module(battleUnit.speed) then
      battleUnit.moveToPosition = nil
    end
  elseif battleUnit.isTrick == true then
    BattleAction.DealTrick(battleUnit)
  else
    battleUnit:ChooseMoveTarget(true)
  end
  if 0 == battleUnit:GetSpdMove() then
    return
  end
  if battleUnit.curState ~= BATTLE_STATE_ENUM.MOVE then
    return
  end
  local speed = battleUnit.speed
  if 0 ~= speed.x or 0 ~= speed.y or 0 ~= speed.z then
    local position = battleUnit.position
    battleUnit:SavePosition(position.x + speed.x, position.y + speed.y, position.z + speed.z)
    battleUnit:UpdatePathIndex()
    BattleScene.UpdateCacheDistance(battleUnit)
    local moveDis = sqrt(speed.x ^ 2 + speed.y ^ 2 + speed.z ^ 2) * BattleScene.pixelsPerUnit
    battleUnit.totalMove = battleUnit.totalMove + moveDis
    battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.MOVE_DISTANCE)
    local trap = BattleScene.IsMoveIntoTRAP(battleUnit)
    if trap then
      local camp = battleUnit.camp
      local uid = battleUnit.uid
      if camp == BATTLE_CAMP_FLAG.LEFT then
        trap:UpdateTrapBuff(BUFF_DEDUCE_TYPE.LEFT_CARD_IN_RANGE, uid)
        trap:UpdateTrapBuff(BUFF_DEDUCE_TYPE.CARD_IN_RANGE, uid)
      elseif camp == BATTLE_CAMP_FLAG.RIGHT then
        trap:UpdateTrapBuff(BUFF_DEDUCE_TYPE.RIGHT_CARD_IN_RANGE, uid)
        trap:UpdateTrapBuff(BUFF_DEDUCE_TYPE.CARD_IN_RANGE, uid)
      end
    end
  end
end

function BattleAction.DealWaitAttack(battleUnit)
  local waitAttackFrame = battleUnit.waitAttackFrame
  if waitAttackFrame then
    waitAttackFrame = waitAttackFrame + 1
    battleUnit.waitAttackFrame = waitAttackFrame
    if waitAttackFrame >= battleUnit:GetCurNeedWaitFrame() then
      battleUnit:SaveTriggerSkill(battleUnit.curSkill)
      local skillId = battleUnit.curSkill.id
      local skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(skillId)
      if skillLevelUpConfig and skillLevelUpConfig.buff_list then
        BattleBuffMgr.GetAllBuff(skillLevelUpConfig, {
          unitUid = battleUnit.uid,
          cardSkillId = skillId
        }, battleUnit.skillTargetUidList)
      end
      if battleUnit.curSkill.type == BATTLE_SKILL_ENUM.NORMAL then
        battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.BEFORE_ATTACK)
        battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.BEFORE_ATTACK_RANDOM)
      end
      BattleAction.ClearAttackInfo(battleUnit)
      battleUnit:SetState(BATTLE_STATE_ENUM.ATTACK)
    end
  end
end

function BattleAction.DealAttack(attackUnit)
  local curSkillId = attackUnit.curSkill.id
  local curSkillType = attackUnit.curSkill.type
  if nil == curSkillId or nil == curSkillType then
    printError("战斗攻击状态异常,skillId或skillType为空:", attackUnit.id, attackUnit.fashionId)
    BattleAction.ForceChangeState(attackUnit, BATTLE_STATE_ENUM.STAND, true)
    return
  end
  local curShowConfig, showId = attackUnit:GetSkillShowConfig(curSkillId)
  local mainSkillLevelUpConfig = attackUnit:GetSkillLevelUpConfig(curSkillId)
  local attackPointList = attackUnit.attackPointList
  local curSkillFrame = attackUnit.curSkillFrame
  if nil == curSkillFrame then
    curSkillFrame = 0
    attackUnit.curSkill.targetInfo = {}
    if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_ATTACK)
    end
    BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_ATTACK, BUFF_SETTLE_TYPE.BEFORE_ATTACK)
    if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_NORMAL_ATTACK, BUFF_SETTLE_TYPE.BEFORE_NORMAL_ATTACK)
      attackUnit:TriggerTransBuff()
    elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
      if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_SMALL)
      end
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_SMALL_SKILL, BUFF_SETTLE_TYPE.BEFORE_SMALL_SKILL)
    elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_UNIQUE_SKILL, BUFF_SETTLE_TYPE.BEFORE_UNIQUE_SKILL)
    elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
      if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_BURST)
      end
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_BURST_SKILL, BUFF_SETTLE_TYPE.BEFORE_BURST_SKILL)
    end
    local curSkillShowDisplayConfig = attackUnit:GetCurSkillShowDisplayConfig(curShowConfig)
    local skillShowDisplayId = curSkillShowDisplayConfig.id
    local buffChangeShow = curSkillShowDisplayConfig.buff_change_show
    if buffChangeShow then
      local splitStr = Split(buffChangeShow, ":")
      local effectId = tonumber(splitStr[1])
      local changeShowId
      if BattleBuffMgr.ContainEffectId(attackUnit, effectId) then
        changeShowId = tonumber(splitStr[2])
        curSkillShowDisplayConfig = TableData.GetConfig(changeShowId, "BaseSkillShowDisplay")
        skillShowDisplayId = changeShowId
      end
    end
    attackUnit.curSkillShowDisplayConfig = curSkillShowDisplayConfig
    local attackPointCountChange = 0
    local contain = BattleBuffMgr.ContainEffectId(attackUnit, BUFF_EFFECT_ID.ATTACK_COUNT_CHANGE_TAG_WITH_BUFF)
    if contain then
      local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(attackUnit, BUFF_EFFECT_ID.ATTACK_COUNT_CHANGE_WITH_BUFF)
      attackPointCountChange = count
    end
    local addPointValue = attackUnit:GetEffectTotalValue(BUFF_EFFECT_ID.ATTACK_COUNT_CHANGE)
    attackPointCountChange = attackPointCountChange + addPointValue
    attackPointList = {}
    local savedList = attackUnit.savedSkillShowDisplayAttackList[skillShowDisplayId]
    if nil == savedList then
      local strList
      local hurt_point = curSkillShowDisplayConfig.hurt_point or {}
      for i = 1, #hurt_point do
        strList = Split(hurt_point[i], ":")
        attackPointList[#attackPointList + 1] = {
          frame = tonumber(strList[1]),
          skillId = tonumber(strList[2] or 0),
          hitSound = tonumber(strList[3]),
          alreadyDeal = nil
        }
      end
      attackUnit.savedSkillShowDisplayAttackList[skillShowDisplayId] = attackPointList
      if attackPointCountChange > 0 then
        local pointList = SimpleCopy(attackPointList)
        for i = 1, attackPointCountChange do
          local lastPoint = pointList[#pointList]
          table.insert(pointList, {
            frame = lastPoint.frame + 1,
            skillId = lastPoint.skillId,
            hitSound = lastPoint.hitSound,
            alreadyDeal = nil
          })
        end
        attackUnit.attackPointList = pointList
        print_battle("当前攻击段数增加：", attackPointCountChange, "技能：", curSkillId)
      else
        attackUnit.attackPointList = attackPointList
      end
    else
      for i = 1, #savedList do
        savedList[i].alreadyDeal = nil
        attackPointList[#attackPointList + 1] = savedList[i]
      end
      if attackPointCountChange > 0 then
        local pointList = SimpleCopy(attackPointList)
        for i = 1, attackPointCountChange do
          local lastPoint = pointList[#pointList]
          table.insert(pointList, {
            frame = lastPoint.frame + 1,
            skillId = lastPoint.skillId,
            hitSound = lastPoint.hitSound,
            alreadyDeal = nil
          })
        end
        attackUnit.attackPointList = pointList
        print_battle("当前攻击段数增加：", attackPointCountChange, "技能：", curSkillId)
      else
        attackUnit.attackPointList = attackPointList
      end
    end
    local attackSoundList = {}
    local attackVoiceList = {}
    local attackSoundTargetList = {}
    local attackWarningEffectList = {}
    if BattleMgr.isBattleServer == false then
      local sound = curSkillShowDisplayConfig.sound
      local soundTarget = curSkillShowDisplayConfig.sound_target
      local warningEffect = curSkillShowDisplayConfig.warning_effect
      if sound then
        savedList = attackUnit.savedAttackSoundList[skillShowDisplayId]
        if nil == savedList then
          local soundPathConfig
          for i = 1, #sound do
            soundPathConfig = TableData.GetConfig(sound[i], "BaseSoundPath")
            if soundPathConfig then
              if nil == soundPathConfig.frame then
                printError("攻击音效未配置frame,soundID：", sound[i])
              end
              attackSoundList[#attackSoundList + 1] = {
                frame = soundPathConfig.frame,
                path = soundPathConfig.path,
                bank = soundPathConfig.bank,
                alreadyDeal = nil
              }
            end
          end
          attackUnit.savedAttackSoundList[skillShowDisplayId] = attackSoundList
        else
          for i = 1, #savedList do
            savedList[i].alreadyDeal = nil
            attackSoundList[#attackSoundList + 1] = savedList[i]
          end
        end
      end
      attackUnit.attackSoundList = attackSoundList
      local fashionBubbleConfig = attackUnit:GetFashionBubbleConfig()
      if fashionBubbleConfig then
        savedList = attackUnit.savedAttackVoiceList[curSkillType]
        if nil == savedList then
          if curSkillType == SKILL_TYPE_ENUM.NORMAL then
            attackVoiceList[#attackVoiceList + 1] = {
              frame = fashionBubbleConfig.attack_delay_frame or 0,
              bubbleType = BUBBLE_TYPE_ENUM.NORMAL
            }
          elseif curSkillType == SKILL_TYPE_ENUM.SMALL then
            attackVoiceList[#attackVoiceList + 1] = {
              frame = fashionBubbleConfig.special_delay_frame or 0,
              bubbleType = BUBBLE_TYPE_ENUM.SPECIAL
            }
          elseif attackUnit.camp ~= BATTLE_CAMP_FLAG.LEFT and (curSkillType == SKILL_TYPE_ENUM.UNIQUE or curSkillType == SKILL_TYPE_ENUM.BURST_CARD) then
            attackVoiceList[#attackVoiceList + 1] = {
              frame = fashionBubbleConfig.unique_delay_frame or 0,
              bubbleType = BUBBLE_TYPE_ENUM.UNIQUE
            }
          end
          attackUnit.savedAttackVoiceList[curSkillType] = attackVoiceList
        else
          for i = 1, #savedList do
            savedList[i].alreadyDeal = nil
            attackVoiceList[#attackVoiceList + 1] = savedList[i]
          end
        end
      end
      attackUnit.attackVoiceList = attackVoiceList
      if soundTarget then
        savedList = attackUnit.savedAttackSoundTargetList[skillShowDisplayId]
        if nil == savedList then
          local soundPathConfig
          for i = 1, #soundTarget do
            soundPathConfig = TableData.GetConfig(soundTarget[i], "BaseSoundPath")
            if soundPathConfig then
              attackSoundTargetList[#attackSoundTargetList + 1] = {
                frame = soundPathConfig.frame,
                path = soundPathConfig.path,
                bank = soundPathConfig.bank,
                alreadyDeal = nil
              }
            end
          end
          attackUnit.savedAttackSoundTargetList[skillShowDisplayId] = attackSoundTargetList
        else
          for i = 1, #savedList do
            savedList[i].alreadyDeal = nil
            attackSoundTargetList[#attackSoundTargetList + 1] = savedList[i]
          end
        end
      end
      attackUnit.attackSoundTargetList = attackSoundTargetList
      if warningEffect then
        savedList = attackUnit.savedWarningEffectList[skillShowDisplayId]
        if nil == savedList then
          local strList
          local rangeType, rangeX, rangeY = BattleChoose.GetRangeInfo(mainSkillLevelUpConfig, nil, attackUnit)
          local targetType = BattleChoose.GetTargetType(mainSkillLevelUpConfig, attackUnit)
          for i = 1, #warningEffect do
            strList = Split(warningEffect[i], ":")
            attackWarningEffectList[#attackWarningEffectList + 1] = {
              targetType = targetType,
              rangeType = rangeType,
              rangeX = rangeX,
              rangeY = rangeY,
              frame_start = tonumber(strList[1]),
              frame_end = tonumber(strList[2]),
              effect_path = strList[3],
              alreadyDeal = nil
            }
          end
          attackUnit.savedWarningEffectList[skillShowDisplayId] = attackWarningEffectList
        else
          for i = 1, #savedList do
            savedList[i].alreadyDeal = nil
            attackWarningEffectList[#attackWarningEffectList + 1] = savedList[i]
          end
        end
      end
      attackUnit.attackWarningEffectList = attackWarningEffectList
    end
  end
  curSkillFrame = curSkillFrame + 1
  attackUnit.curSkillFrame = curSkillFrame
  local curAttackFrameScale
  if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
    curAttackFrameScale = attackUnit.attackFrameScale
  else
    curAttackFrameScale = attackUnit.defaultModelScale
  end
  local subSkillId, subSkillConfig, hurtNum, hurtExtraParams, bullet
  local bulletSpeed = mainSkillLevelUpConfig.bullet_speed
  local bombDelay = mainSkillLevelUpConfig.bomb_delay_frame
  local isContain, effectList, buffList, mainDamageRate, transferDamageRate, transferTargets
  if BattleMgr.isBattleServer == false then
    local attackSoundList = attackUnit.attackSoundList
    local soundPoint
    for i = 1, #attackSoundList do
      soundPoint = attackSoundList[i]
      if nil == soundPoint.alreadyDeal and ceil(soundPoint.frame * curAttackFrameScale / 10000) == curSkillFrame - 1 then
        soundPoint.alreadyDeal = true
        BattleActionDisplay.AddWaitDealSound(soundPoint.path, soundPoint.bank, attackUnit.model or attackUnit.effectModel)
      end
    end
    local attackVoiceList = attackUnit.attackVoiceList
    local voicePoint
    for i = 1, #attackVoiceList do
      voicePoint = attackVoiceList[i]
      if nil == voicePoint.alreadyDeal and ceil(voicePoint.frame * curAttackFrameScale / 10000) == curSkillFrame - 1 then
        voicePoint.alreadyDeal = true
        BattleActionDisplay.AddWaitDealVoice(attackUnit.uid, voicePoint.bubbleType)
      end
    end
    local warningEffectList = attackUnit.attackWarningEffectList
    local effectPoint
    for i = 1, #warningEffectList do
      effectPoint = warningEffectList[i]
      if nil == effectPoint.alreadyDeal and ceil(effectPoint.frame_start * curAttackFrameScale / 10000) == curSkillFrame - 1 then
        effectPoint.alreadyDeal = true
        effectPoint.index = BattleActionDisplay.GetWaitWarningEffectIndex()
        local totalFrame = ceil((effectPoint.frame_end - effectPoint.frame_start) * curAttackFrameScale / 10000)
        BattleActionDisplay.AddWaitDealWarningEffect(attackUnit, effectPoint.effect_path, effectPoint.targetType, effectPoint.rangeType, effectPoint.rangeX, effectPoint.rangeY, effectPoint.index, totalFrame)
      end
      if effectPoint.alreadyDeal == true and ceil(effectPoint.frame_end * curAttackFrameScale / 10000) == curSkillFrame - 1 then
        local index = effectPoint.index
        attackUnit:RemoveEffect(effectPoint.effect_path .. "_" .. index, true)
      end
    end
  end
  local targetUidList, targetUnitList, attackPoint
  for hurtIndex = 1, #attackPointList do
    attackPoint = attackPointList[hurtIndex]
    if nil == attackPoint.alreadyDeal and ceil(MathUtil.TruncateFloat(attackPoint.frame * curAttackFrameScale / 10000)) == curSkillFrame then
      attackPoint.alreadyDeal = true
      subSkillId = attackPoint.skillId
      subSkillConfig = attackUnit:GetSubSkillConfig(subSkillId)
      local reChooseTarget = BattleAction.IsIgnoreTargetInRange(attackUnit, curSkillId)
      if true == reChooseTarget then
        targetUnitList = BattleChoose.GetSkillTargetUnitList({
          unitUid = attackUnit.uid
        }, {}, mainSkillLevelUpConfig)
      else
        if nil == targetUidList then
          targetUidList = attackUnit:GetTargetUidList()
          targetUnitList = BattleScene.GetUnitListByUidList(targetUidList)
        end
        if 0 ~= mainSkillLevelUpConfig.damage_rate and showId and 1 ~= mainSkillLevelUpConfig.ignore_target_state then
          local canAttack = false
          local unit
          for i = 1, #targetUnitList do
            unit = targetUnitList[i]
            if true == unit:CanTargetChosen() then
              canAttack = true
              break
            end
          end
          if false == canAttack then
            BattleAction.ForceChangeState(attackUnit, BATTLE_STATE_ENUM.STAND, true)
            return
          end
        end
      end
      if 1 == hurtIndex then
        if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_ATTACK_1_HURT, nil, {targetUnitList = targetUnitList})
        end
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_ATTACK_1_HURT, BUFF_SETTLE_TYPE.BEFORE_ATTACK_1_HURT)
        if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_NORMAL_ATTACK_1_HURT, BUFF_SETTLE_TYPE.BEFORE_NORMAL_ATTACK_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
          if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_SMALL_ATTACK_1_HURT, nil, {targetUnitList = targetUnitList})
          end
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_SMALL_SKILL_1_HURT, BUFF_SETTLE_TYPE.BEFORE_SMALL_SKILL_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_UNIQUE_SKILL_1_HURT, BUFF_SETTLE_TYPE.BEFORE_UNIQUE_SKILL_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
          if mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_RANGE_BURST_ATTACK_1_HURT, nil, {targetUnitList = targetUnitList})
          end
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_BURST_SKILL_1_HURT, BUFF_SETTLE_TYPE.BEFORE_BURST_SKILL_1_HURT)
        end
      end
      BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_ATTACK_HURT, BUFF_SETTLE_TYPE.BEFORE_ATTACK_HURT)
      if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_NORMAL_ATTACK_HURT, BUFF_SETTLE_TYPE.BEFORE_NORMAL_ATTACK_HURT)
      elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_SMALL_SKILL_HURT, BUFF_SETTLE_TYPE.BEFORE_SMALL_SKILL_HURT)
      elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_UNIQUE_SKILL_HURT, BUFF_SETTLE_TYPE.BEFORE_UNIQUE_SKILL_HURT)
      elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.BEFORE_BURST_SKILL_HURT, BUFF_SETTLE_TYPE.BEFORE_BURST_SKILL_HURT)
      end
      if subSkillConfig.buff_list then
        BattleBuffMgr.GetAllBuff(subSkillConfig, {
          unitUid = attackUnit.uid
        }, BattleScene.GetUidListByUnitList(targetUnitList), true)
      end
      if 0 ~= mainSkillLevelUpConfig.damage_rate or showId then
        local realNum = 0
        local defUnit
        for i = 1, #targetUnitList do
          defUnit = targetUnitList[i]
          if true == defUnit:CanTargetChosen() or 1 == mainSkillLevelUpConfig.ignore_target_state then
            if bombDelay then
              local curSkill = attackUnit.curSkill
              local hitSameTargetCount = (curSkill.targetInfo[defUnit.uid] or 0) + 1
              curSkill.targetInfo[defUnit.uid] = hitSameTargetCount
              local curShowDisplayConfig = attackUnit.curSkillShowDisplayConfig
              local initDelayFrame = 0
              if mainSkillLevelUpConfig.bomb_interval_frame then
                initDelayFrame = mainSkillLevelUpConfig.bomb_interval_frame * (i - 1)
              end
              local bomb = BattleBomb.NewBomb(curShowDisplayConfig, attackUnit, defUnit, curSkillId, subSkillId, {
                initDelayFrame = initDelayFrame,
                bombDelayFrame = bombDelay,
                hurtIndex = hurtIndex,
                hitSameTargetCount = hitSameTargetCount,
                hitSound = attackPoint.hitSound
              })
              if BattleBuffMgr.ContainEffectId(attackUnit, BUFF_EFFECT_ID.RANGE_HURT_UP) and mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
                bomb.finalDamageUpRatio = #targetUnitList
              end
              BattleScene.AddBomb(bomb)
              if mainSkillLevelUpConfig.bomb_buff_list then
                BattleBuffMgr.GetAllBombBuff(mainSkillLevelUpConfig, {
                  unitUid = attackUnit.uid
                }, {
                  bombUid = bomb.uid
                }, true)
              end
            elseif bulletSpeed and bulletSpeed > 0 then
              mainDamageRate, transferDamageRate = nil, nil
              isContain, effectList = BattleBuffMgr.GetContainedEffect(attackUnit, BUFF_EFFECT_ID.TRANSFER_DAMAGE)
              if true == isContain then
                local attackTargetUid = attackUnit:GetAttackTargetUid()
                local targetUnit = BattleScene.GetUnitByUid(attackTargetUid)
                if targetUnit then
                  transferTargets = BattleChoose.GetNearestUnit(targetUnit, true, nil, 1, false, true)
                  if #transferTargets > 0 then
                    transferDamageRate = 0
                    for j = 1, #effectList do
                      transferDamageRate = transferDamageRate + effectList[j].finalValue
                    end
                    mainDamageRate = 10000 - transferDamageRate
                  end
                end
              end
              local curShowDisplayConfig = attackUnit.curSkillShowDisplayConfig
              local delayFrame
              if mainSkillLevelUpConfig.bullet_interval then
                delayFrame = mainSkillLevelUpConfig.bullet_interval * (i - 1)
              end
              bullet = BattleBullet.NewBullet(curShowDisplayConfig, attackUnit, defUnit, nil, nil, subSkillId, curSkillId, bulletSpeed, {
                delayFrame = delayFrame,
                mainDamageRate = mainDamageRate,
                rageHit = 1 == hurtIndex,
                hurtIndex = hurtIndex
              })
              if BattleBuffMgr.ContainEffectId(attackUnit, BUFF_EFFECT_ID.RANGE_HURT_UP) and mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
                bullet.finalDamageUpRatio = #targetUnitList
              end
              BattleScene.AddBullet(bullet)
              if mainSkillLevelUpConfig.bullet_buff_list then
                BattleBuffMgr.GetAllBulletBuff(mainSkillLevelUpConfig, {
                  unitUid = attackUnit.uid
                }, {
                  bulletUid = bullet.uid
                }, true)
              end
              BattleBuffMgr.DealBulletDirectDamage({
                unitUid = attackUnit.uid
              }, {
                bulletUid = bullet.uid
              })
              BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, bullet)
              if transferDamageRate then
                bullet = BattleBullet.NewBullet(curShowDisplayConfig, attackUnit, transferTargets[1], nil, nil, subSkillId, curSkillId, bulletSpeed, {transferDamageRate = transferDamageRate, hurtIndex = hurtIndex})
                BattleScene.AddBullet(bullet)
                BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, bullet)
              end
              isContain, effectList, buffList = BattleBuffMgr.GetContainedEffect(attackUnit, BUFF_EFFECT_ID.EXTRA_DAMAGE_ATTACK, nil, true)
              if true == isContain then
                bullet = BattleBullet.NewBullet(curShowDisplayConfig, attackUnit, defUnit, nil, nil, subSkillId, curSkillId, bulletSpeed, {
                  delayFrame = 5,
                  effectList = effectList,
                  hurtIndex = hurtIndex,
                  bendScale = -1,
                  beAffectedWithEffects = buffList[1].beAffectedWithEffects
                })
                BattleScene.AddBullet(bullet)
                BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, bullet)
              end
              isContain, effectList, buffList = BattleBuffMgr.GetContainedEffect(attackUnit, BUFF_EFFECT_ID.SPLASH, nil, true)
              if true == isContain then
                local splashTarget = BattleChoose.GetNearestUnit(attackUnit, false, nil, 1, false, nil, defUnit.uid)
                if #splashTarget > 0 then
                  bullet = BattleBullet.NewBullet(curShowDisplayConfig, attackUnit, splashTarget[1], nil, nil, subSkillId, curSkillId, bulletSpeed, {
                    effectList = effectList,
                    hurtIndex = hurtIndex,
                    beAffectedWithEffects = buffList[1].beAffectedWithEffects
                  })
                  BattleScene.AddBullet(bullet)
                  if mainSkillLevelUpConfig.bullet_buff_list then
                    BattleBuffMgr.GetAllBulletBuff(mainSkillLevelUpConfig, {
                      unitUid = attackUnit.uid
                    }, {
                      bulletUid = bullet.uid
                    }, true)
                  end
                  BattleBuffMgr.DealBulletDirectDamage({
                    unitUid = attackUnit.uid
                  }, {
                    bulletUid = bullet.uid
                  })
                  BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, bullet)
                end
              else
                isContain, effectList, buffList = BattleBuffMgr.GetContainedEffect(attackUnit, BUFF_EFFECT_ID.SPLASH_TWO, nil, true)
                if true == isContain then
                  local splashTarget = BattleChoose.GetNearestUnit(attackUnit, false, nil, 2, false, nil, defUnit.uid)
                  if #splashTarget > 0 then
                    for i, v in ipairs(splashTarget) do
                      bullet = BattleBullet.NewBullet(curShowDisplayConfig, attackUnit, v, nil, nil, subSkillId, curSkillId, bulletSpeed, {
                        effectList = effectList,
                        hurtIndex = hurtIndex,
                        beAffectedWithEffects = buffList[1].beAffectedWithEffects
                      })
                      BattleScene.AddBullet(bullet)
                      if mainSkillLevelUpConfig.bullet_buff_list then
                        BattleBuffMgr.GetAllBulletBuff(mainSkillLevelUpConfig, {
                          unitUid = attackUnit.uid
                        }, {
                          bulletUid = bullet.uid
                        }, true)
                      end
                      BattleBuffMgr.DealBulletDirectDamage({
                        unitUid = attackUnit.uid
                      }, {
                        bulletUid = bullet.uid
                      })
                      BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, bullet)
                    end
                  end
                end
              end
            else
              if BattleBuffMgr.ContainEffectId(attackUnit, BUFF_EFFECT_ID.RANGE_HURT_UP) and mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
                hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(curSkillId, subSkillId, attackUnit, defUnit, nil, hurtIndex, {
                  finalDamageUpRatio = #targetUnitList
                })
              elseif BattleBuffMgr.ContainEffectId(attackUnit, BUFF_EFFECT_ID.NOT_ATTACK_TARGET_HURT_UP) and defUnit.uid ~= attackUnit:GetAttackTargetUid() and mainSkillLevelUpConfig.damage_rate > 0 and mainSkillLevelUpConfig.range_type then
                local ratioValue = attackUnit:GetEffectTotalValue(BUFF_EFFECT_ID.NOT_ATTACK_TARGET_HURT_UP)
                hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(curSkillId, subSkillId, attackUnit, defUnit, nil, hurtIndex, {
                  finalDamageUpRatio = ratioValue / 10000
                })
              else
                hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(curSkillId, subSkillId, attackUnit, defUnit, nil, hurtIndex)
              end
              if hurtNum then
                if hurtNum >= 0 and defUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
                  if attackUnit:CanTargetChosen() then
                    BattleAction.DealMoveToAttack(attackUnit, defUnit)
                  end
                elseif hurtNum < 0 and 1 == hurtIndex then
                  BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
                    treatUnitUid = defUnit.uid,
                    treatNum = -hurtNum
                  })
                end
                local hurtEffectParams = {
                  showDisplayConfig = attackUnit.curSkillShowDisplayConfig,
                  fromUid = attackUnit.uid,
                  hurtIndex = hurtIndex,
                  hitSound = attackPoint.hitSound
                }
                realNum = BattleAction.DealHurt(attackUnit, defUnit, hurtNum, nil, hurtExtraParams, hurtEffectParams, attackUnit.position.x > defUnit.position.x)
                local absorbHurt = hurtExtraParams.absorbHurt or 0
                local num = realNum + absorbHurt
                if 0 ~= num then
                  attackUnit:SaveSkillDamageForTestBalance(num, curSkillType)
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
                if 1 == hurtIndex and defUnit.haveRage then
                  BattleAction.DealRageChange(defUnit, defUnit:GetAttr(ATTR_ENUM.rage_hit))
                end
                local contain, _, buffs = BattleBuffMgr.GetContainedEffect(attackUnit, BUFF_EFFECT_ID.CATAPULT_TAG, nil, true)
                if contain then
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
                        local extra_showDisplayConfig = TableData.GetConfig(extra_showDisplayId, "BaseSkillShowDisplay")
                        if extra_showDisplayConfig then
                          local bulletSubSkillId
                          local bulletHurtPoint = extra_showDisplayConfig.hurt_point
                          if bulletHurtPoint then
                            bulletSubSkillId = tonumber(Split(bulletHurtPoint[1], ":")[2])
                          end
                          if bulletSubSkillId then
                            local nextBullet = BattleBullet.NewBullet(extra_showDisplayConfig, defUnit, nextUnit, nil, nil, bulletSubSkillId, curSkillId, extra_showDisplayConfig.bullet_speed, {
                              hurtIndex = 1,
                              startPointName = "hit",
                              fromUnitUid = attackUnit.uid
                            })
                            BattleScene.AddBullet(nextBullet)
                            BattleBuffMgr.DealBulletFinalDamageAdd(attackUnit, nil, nextBullet)
                            local effects = tempBuff.beAffectedWithEffects
                            local totalValue = 0
                            if effects and #effects > 0 then
                              for _, effectId in ipairs(effects) do
                                totalValue = totalValue + BattleBuffMgr.GetValueById(attackUnit, effectId)
                              end
                              if 0 ~= totalValue then
                                nextBullet.finalDamageAddPer = nextBullet.finalDamageAddPer + totalValue
                              end
                            end
                            local buffId = tonumber(param[2])
                            local buff = BattleBuffMgr.NewBuff(buffId, {
                              unitUid = attackUnit.uid
                            }, {
                              bulletUid = nextBullet.uid
                            }, true)
                            buff:AddBulletTargetUid(defUnit.uid)
                          end
                        end
                      end
                    end
                  end
                end
              end
              if hurtExtraParams.counter then
                local counterEffectParams
                if hurtExtraParams.counter.counterEffectPath then
                  counterEffectParams = {
                    effectPath = hurtExtraParams.counter.counterEffectPath
                  }
                end
                realNum = BattleAction.DealHurt(defUnit, attackUnit, hurtExtraParams.counter.counterValue, nil, nil, counterEffectParams)
                local absorbHurt = hurtExtraParams.counter.absorbHurt or 0
                local num = realNum + absorbHurt
                if 0 ~= num then
                  defUnit:SaveSkillDamageForTestBalance(num)
                  defUnit:SaveDamage(num)
                  attackUnit:SaveDamaged(num)
                  if defUnit.camp == attackUnit.enemyCamp then
                    BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
                  end
                  if false == defUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
                    BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
                      hurtFromUnitUid = defUnit.uid
                    })
                  end
                end
                if attackUnit.camp == defUnit.enemyCamp then
                  BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
                    hurtFromUnitUid = defUnit.uid
                  })
                end
              end
            end
          end
        end
      end
      if 1 == hurtIndex then
        BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.AFTER_ATTACK_1_HURT, BUFF_SETTLE_TYPE.AFTER_ATTACK_1_HURT)
        if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.AFTER_NORMAL_ATTACK_1_HURT, BUFF_SETTLE_TYPE.AFTER_NORMAL_ATTACK_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.AFTER_SMALL_SKILL_1_HURT, BUFF_SETTLE_TYPE.AFTER_SMALL_SKILL_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.AFTER_UNIQUE_SKILL_1_HURT, BUFF_SETTLE_TYPE.AFTER_UNIQUE_SKILL_1_HURT)
        elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.AFTER_BURST_SKILL_1_HURT, BUFF_SETTLE_TYPE.AFTER_BURST_SKILL_1_HURT)
        end
        if attackUnit.haveRage then
          BattleAction.DealRageChange(attackUnit, attackUnit:GetAttr(ATTR_ENUM.rage_atk))
        end
      end
    end
  end
  local curTotalFrame = attackUnit:GetCurSkillTotalFrame()
  if nil == curTotalFrame or curSkillFrame >= curTotalFrame then
    attackUnit:SetState(BATTLE_STATE_ENUM.ATTACK_OVER)
    if BattleMgr.isBattleServer == false and curSkillType == SKILL_TYPE_ENUM.BURST_CARD then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_REMOVE_CARD_BURST_EFFECT, attackUnit.uid)
    end
  end
end

function BattleAction.DealAttackOver(battleUnit)
  local isContainExtraUniqueSkill, effectList = false
  local damageRate = 0
  local isContainExtraBurstSkill, effectList_burst = false
  local damageRateBurst = 0
  local curSkillType = battleUnit.curSkill.type
  BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_ATTACK, BUFF_SETTLE_TYPE.AFTER_ATTACK)
  if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_NORMAL_ATTACK, BUFF_SETTLE_TYPE.AFTER_NORMAL_ATTACK)
  elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_SMALL_SKILL, BUFF_SETTLE_TYPE.AFTER_SMALL_SKILL)
  elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
    isContainExtraUniqueSkill, effectList = BattleBuffMgr.GetContainedEffect(battleUnit, BUFF_EFFECT_ID.EXTRA_UNIQUE_SKILL)
    if true == isContainExtraUniqueSkill then
      for i = 1, #effectList do
        damageRate = damageRate + effectList[i].finalValue
      end
    end
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_UNIQUE_SKILL, BUFF_SETTLE_TYPE.AFTER_UNIQUE_SKILL)
    battleUnit.treatedTemp_1 = 0
  elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
    isContainExtraBurstSkill, effectList_burst = BattleBuffMgr.GetContainedEffect(battleUnit, BUFF_EFFECT_ID.EXTRA_BURST_SKILL)
    if true == isContainExtraBurstSkill then
      for i = 1, #effectList_burst do
        damageRateBurst = damageRateBurst + effectList_burst[i].finalValue
      end
    end
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_BURST_SKILL, BUFF_SETTLE_TYPE.AFTER_BURST_SKILL)
  end
  if true == isContainExtraUniqueSkill or true == isContainExtraBurstSkill then
    BattleAction.ClearAttackInfo(battleUnit)
    BattleActionDisplay.ClearAttackDisplay(battleUnit)
    if isContainExtraUniqueSkill then
      battleUnit.extraUniqueSkillDamageRate = damageRate
    elseif isContainExtraBurstSkill then
      battleUnit.extraBurstSkillDamageRate = damageRateBurst
    end
    local targetUidList = battleUnit:GetTargetUidList()
    local targetUnitList = BattleScene.GetUnitListByUidList(targetUidList)
    local canAttack = false
    for i = 1, #targetUnitList do
      local unit = targetUnitList[i]
      if true == unit:CanTargetChosen() then
        canAttack = true
        break
      end
    end
    if false == canAttack then
      local nearestUnitList = BattleChoose.GetUnitForChooseMoveTarget(battleUnit)
      if #nearestUnitList <= 0 then
        BattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.STAND)
        return
      else
        local unit = nearestUnitList[1]
        battleUnit.skillTargetUidList = {
          unit.uid
        }
      end
    end
    battleUnit:SetState(BATTLE_STATE_ENUM.ATTACK)
    return
  elseif battleUnit.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
    BattleAction.ForceChangeState(battleUnit)
  end
  battleUnit.extraUniqueSkillDamageRate = nil
  battleUnit.extraBurstSkillDamageRate = nil
  battleUnit.skillWhenDying = nil
  battleUnit.delayCancelBeAttractTargetUid = nil
  if battleUnit.id == SPECIAL_CARD_OR_MONSTER.HEI_YU then
    battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HP_PER_WITH_SUMMON)
    if BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.SPECIAL_116) then
      if nil == battleUnit.specialStateRemainFrames then
        BattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.SPECIAL)
      else
        local _, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(battleUnit, BUFF_EFFECT_ID.STEALTH, function(array)
          table.sort(array, function(a, b)
            return a.uid > b.uid
          end)
        end)
        for i = #buffTable, 1, -1 do
          local buff = buffTable[i]
          if buff then
            buff:Remove()
          end
        end
      end
    end
  end
end

function BattleAction.DealDying(battleUnit)
  battleUnit:ClearControlState()
  BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.SELF_DYING)
  if BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.REVIVE) == true then
    battleUnit:SetStateToRevive()
  elseif true == BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.UNYIELDING) then
  else
    battleUnit:SetStateToDead(true)
    if battleUnit.canTriggerSelfDyingSkill then
      battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_DYING)
      battleUnit.canTriggerSelfDyingSkill = false
    end
    if battleUnit.curState == BATTLE_STATE_ENUM.DEAD then
      if battleUnit.summonId == nil and false == battleUnit.isBuilding then
        battleUnit:DealTriggerPartnerSkillAll(TRIGGER_CONDITION.PARTNER_DYING, false, battleUnit.uid)
      end
      if false == battleUnit.isBuilding then
        battleUnit:DealTriggerEnemySkillAll(TRIGGER_CONDITION.ENEMY_DEAD, battleUnit.uid)
      end
    end
  end
end

function BattleAction.DealDead(battleUnit)
  local waitFrameDying = battleUnit.waitFrameDying
  if nil == waitFrameDying or waitFrameDying <= 0 then
    if BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.WAIT_FOR_REVIVE) == true then
      return
    end
    battleUnit.waitFrameDying = nil
    if -1 == battleUnit.deadTime then
      battleUnit.deadTime = BattleControl.curFixedFrame
      if BattleControl.testBalanceLeftId == battleUnit.id then
        BattleControl.testBalanceLeftDeadTime = battleUnit.deadTime
      end
    end
    print_battle("处理死亡后buff", battleUnit.uid)
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.SELF_DEAD, BUFF_SETTLE_TYPE.SELF_DEAD)
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.SELF_DEAD_WITHOUT_REVIVE)
    local killedByUid = battleUnit.lastKillSelfUnitUid or battleUnit.lastDamageSelfUnitUid or 0
    if 0 ~= killedByUid then
      local unit = BattleScene.GetUnitByUid(killedByUid)
      if unit and unit.camp == battleUnit.enemyCamp then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.KILLED_BY_ENEMY)
      end
    end
    BattleBuffMgr.TriggerRemoveListener(BUFF_REMOVE_TYPE.UNIT_FROM_DEAD, {unitDead = battleUnit})
    if battleUnit.curState == BATTLE_STATE_ENUM.DEAD then
      if true ~= battleUnit.isBuilding then
        if battleUnit.camp == BATTLE_CAMP_FLAG.LEFT then
          BattleScene.LeftUnitDead(battleUnit)
        elseif battleUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
          BattleScene.RightUnitDead(battleUnit)
          if true == battleUnit.isMonster and battleUnit.isBuilding == false then
            BattleData.killMobCount = BattleData.killMobCount + 1
          end
        end
      end
      battleUnit:SetStateToDestroy()
    end
  else
    waitFrameDying = waitFrameDying - 1
    battleUnit.waitFrameDying = waitFrameDying
  end
end

function BattleAction.DealRevive(battleUnit)
  local waitFrameDying = battleUnit.waitFrameDying
  if nil == waitFrameDying then
    waitFrameDying = BATTLE_CONFIG_ENUM.DEFAULT_DYING_FRAMES
  end
  waitFrameDying = waitFrameDying - 1
  if waitFrameDying < 0 then
    battleUnit.waitFrameDying = nil
    print_battle("复活后，处理死亡后buff", battleUnit.uid)
    BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.SELF_DEAD, BUFF_SETTLE_TYPE.SELF_DEAD)
    if battleUnit.curState == BATTLE_STATE_ENUM.REVIVE then
      battleUnit:SetState(BATTLE_STATE_ENUM.STAND)
    end
  else
    battleUnit.waitFrameDying = waitFrameDying
  end
end

function BattleAction.DealBeatBack(battleUnit)
  local beatBackFrames = battleUnit.beatBackFrames
  beatBackFrames = beatBackFrames - 1
  if beatBackFrames < 0 then
    battleUnit.beatBackFrames = nil
    battleUnit:SetPosition()
    battleUnit:SetState(BATTLE_STATE_ENUM.STAND, true)
  else
    battleUnit.beatBackFrames = beatBackFrames
    local position = battleUnit.position
    position = MathUtil.GetVector3Add(position, battleUnit.beatBackPerFrame)
    battleUnit:SavePosition(position.x, position.y, position.z)
    battleUnit:UpdatePathIndex()
    BattleScene.UpdateCacheDistance(battleUnit)
  end
end

function BattleAction.DealDevour(battleUnit)
  local devourFrames = battleUnit.devourFrames
  devourFrames = devourFrames - 1
  if devourFrames < 0 then
    battleUnit.devourFrames = nil
    battleUnit:SetPosition()
    battleUnit:SetState(BATTLE_STATE_ENUM.STAND)
  else
    battleUnit.devourFrames = devourFrames
    local position = battleUnit.position
    position = MathUtil.GetVector3Add(position, battleUnit.devourPerFrame)
    battleUnit:SavePosition(position.x, position.y, position.z)
    battleUnit:UpdatePathIndex()
    BattleScene.UpdateCacheDistance(battleUnit)
  end
end

function BattleAction.DealFear(battleUnit)
  if 0 == battleUnit:GetSpdMove() then
    return
  end
  if battleUnit.fearStartPosition == nil then
    battleUnit.fearStartPosition = SimpleCopy(battleUnit.position)
  end
  if nil == battleUnit.fearTargetPosition then
    battleUnit:CreateFearTargetPosition()
  end
  local speed = BattleScene.GetSpeed(battleUnit.position, battleUnit.fearTargetPosition, MathUtil.TruncateFloat(battleUnit:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS), nil, true)
  if math.abs(speed.x) >= 0.1 or math.abs(speed.y) >= 0.1 or math.abs(speed.z) >= 0.1 then
    local position = battleUnit.position
    battleUnit:SavePosition(position.x + speed.x, position.y + speed.y, position.z + speed.z)
    battleUnit:UpdatePathIndex()
    BattleScene.UpdateCacheDistance(battleUnit)
    if speed.x > 0 then
      battleUnit:SetModelFlip(false)
    elseif speed.x < 0 then
      battleUnit:SetModelFlip(true)
    end
  else
    battleUnit:CreateFearTargetPosition()
  end
end

function BattleAction.DealPortal(battleUnit)
  local newPosition = BattleScene.GetPortalTargetPosition()
  battleUnit:SavePosition(newPosition.x, newPosition.y, newPosition.z)
  battleUnit:SetPosition()
  battleUnit:UpdatePathIndex()
  BattleScene.UpdateCacheDistance(battleUnit)
  print_battle("传送 传送角色：", battleUnit:GetName())
  BattleScene.DealClearTarget(battleUnit)
  BattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.STAND)
end

function BattleAction.DealSpecial(battleUnit)
  if battleUnit.id == SPECIAL_CARD_OR_MONSTER.HEI_YU then
    if battleUnit.specialStateRemainFrames == nil then
      battleUnit.specialStateRemainFrames = 68
    else
      battleUnit.specialStateRemainFrames = battleUnit.specialStateRemainFrames - 1
    end
    if 40 == battleUnit.specialStateRemainFrames then
      battleUnit:ResetToOriPosition()
      battleUnit:SetPosition()
      BattleScene.UpdateCacheDistance(battleUnit)
    elseif 19 == battleUnit.specialStateRemainFrames then
      local uids = battleUnit.cachedSummonUids
      if uids and #uids > 0 then
        local uid = uids[1]
        local summonUnit = BattleScene.GetUnitByUid(uid)
        if summonUnit then
          summonUnit:SetStateToDead()
        end
      end
    elseif battleUnit.specialStateRemainFrames <= 0 then
      local success = BattleAction.DealSpecialEnd(battleUnit)
      if true == success then
        return
      end
      if nil == battleUnit.specialStateDelayFrames then
        battleUnit.specialStateDelayFrames = 1
      else
        battleUnit.specialStateDelayFrames = battleUnit.specialStateDelayFrames + 1
      end
      if battleUnit.specialStateDelayFrames > battleUnit.specialStateDelayMaxFrames then
        battleUnit.specialStateEndFrame = BattleControl.curFixedFrame
      end
    end
  end
end

function BattleAction.DealSpecialEnd(battleUnit)
  battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.SPECIAL_AFTER_SWORD)
  local skillTargetUidList = battleUnit.skillTargetUidList
  if skillTargetUidList and #skillTargetUidList > 0 then
    local targetUid = skillTargetUidList[1]
    local targetUnit = BattleScene.GetUnitByUid(targetUid)
    if targetUnit then
      local x
      local offX = 5 + (targetUnit.coverRadiusR or targetUnit.coverRadiusHalfW) / BattleScene.pixelsPerUnit
      if battleUnit.position.x < targetUnit.position.x then
        x = targetUnit.position.x - offX
      elseif battleUnit.position.x > targetUnit.position.x then
        x = targetUnit.position.x + offX
      elseif BattleData.isMirror then
        x = targetUnit.position.x + offX
      else
        x = targetUnit.position.x - offX
      end
      battleUnit:SavePosition(x, targetUnit.position.y, targetUnit.position.z)
      battleUnit:SetPosition()
      BattleScene.UpdateCacheDistance(battleUnit)
      battleUnit.specialStateDelayFrames = nil
      return true
    end
  end
end

function BattleAction.ForceChangeState(battleUnit, changeToState, triggerBuff)
  if battleUnit.curState == changeToState then
    return
  end
  if battleUnit.curState == BATTLE_STATE_ENUM.MOVE then
    BattleAction.DealStopMove(battleUnit, changeToState)
  elseif battleUnit.curState == BATTLE_STATE_ENUM.ATTACK or battleUnit.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
    if true == triggerBuff then
      local curSkillType = battleUnit.curSkill.type
      BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_ATTACK, BUFF_SETTLE_TYPE.AFTER_ATTACK)
      if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_NORMAL_ATTACK, BUFF_SETTLE_TYPE.AFTER_NORMAL_ATTACK)
      elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_SMALL_SKILL, BUFF_SETTLE_TYPE.AFTER_SMALL_SKILL)
      elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_UNIQUE_SKILL, BUFF_SETTLE_TYPE.AFTER_UNIQUE_SKILL)
        battleUnit.treatedTemp_1 = 0
      elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.AFTER_BURST_SKILL, BUFF_SETTLE_TYPE.AFTER_BURST_SKILL)
      end
    end
    BattleAction.DealStopAttack(battleUnit, changeToState)
  else
    battleUnit:SetState(changeToState)
  end
end

function BattleAction.DealStopAttack(battleUnit, changeToState)
  local attackType = battleUnit.curSkill.type
  battleUnit.curSkill = {}
  battleUnit.skillTargetUidList = {}
  battleUnit.waitAttackFrame = 0
  battleUnit.curStartInterval = nil
  battleUnit.spineState = nil
  battleUnit.skillWhenDying = nil
  BattleAction.ClearAttackInfo(battleUnit)
  if BattleMgr.isBattleServer == false and battleUnit.curState == BATTLE_STATE_ENUM.ATTACK then
    BattleActionDisplay.ClearSkillEffect(battleUnit)
    if battleUnit.camp == BATTLE_CAMP_FLAG.LEFT and attackType == SKILL_TYPE_ENUM.BURST_CARD then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_REMOVE_CARD_BURST_EFFECT, battleUnit.uid)
    end
  end
  battleUnit:SetState(changeToState or BATTLE_STATE_ENUM.STAND)
  BattleBuffMgr.UnRegisterSettleListenerByUnitUid(battleUnit.uid)
  if attackType == BATTLE_SKILL_ENUM.NORMAL then
    battleUnit:DealTriggerSkillAll(TRIGGER_CONDITION.AFTER_ATTACK)
  end
end

function BattleAction.ClearAttackInfo(battleUnit)
  battleUnit.curSkillFrame = nil
  battleUnit.attackPointList = nil
  battleUnit.attackSoundList = nil
  battleUnit.attackVoiceList = nil
  battleUnit.curSkillShowDisplayConfig = nil
end

function BattleAction.DealStopMove(battleUnit, changeToState)
  battleUnit:SetPosition()
  battleUnit.speed = {
    x = 0,
    y = 0,
    z = 0
  }
  battleUnit.waitAttackFrame = 0
  battleUnit.curStartInterval = battleUnit.defaultStartInterval
  battleUnit:SetState(changeToState or BATTLE_STATE_ENUM.STAND)
end

function BattleAction.DealSummon(data, triggerBuff)
  local unit = BattleScene.AddUnit(data)
  if unit then
    BattleScene.AddUnitToCampList(unit)
    BattleAction.DealUnitBasicBuff(unit)
  end
  if true == triggerBuff then
    local unitUid = data.summonFromUnit
    if unitUid then
      local fromUnit = BattleScene.GetUnitByUid(unitUid)
      BattleBuffMgr.TriggerUnitListener(fromUnit, BUFF_DEDUCE_TYPE.AFTER_SUMMON)
    end
  end
end

function BattleAction.DealHurt(attackUnit, defUnit, num, hurtDisplayType, hurtExtraParams, hurtEffectParams, hurtEffectFlip)
  local realNum = 0
  if num then
    if num > 0 then
      local curHp = defUnit:GetHp()
      if curHp - num < 0 then
        realNum = curHp
      else
        realNum = num
      end
      hurtDisplayType = hurtDisplayType or HURT_NUM_ENUM.NOR_HURT
      if hurtExtraParams then
        if hurtExtraParams.isCrit == true then
          hurtDisplayType = HURT_NUM_ENUM.CRI_HURT
        elseif true == hurtExtraParams.isBlock then
          hurtDisplayType = HURT_NUM_ENUM.BLOCK_HURT
        end
      end
      if realNum > 0 then
        defUnit.totalHurt = defUnit.totalHurt + realNum
      end
    elseif num < 0 then
      local curHp = defUnit:GetHp()
      local maxHp = defUnit:GetAttr(ATTR_ENUM.max_hp)
      if maxHp < curHp - num then
        realNum = curHp - maxHp
      else
        realNum = num
      end
      hurtDisplayType = HURT_NUM_ENUM.NOR_TREATMENT
      BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.TREATED)
    elseif hurtExtraParams then
      if true == hurtExtraParams.isDodge then
        hurtDisplayType = HURT_NUM_ENUM.MISS_HURT
      elseif true == hurtExtraParams.isInvincible then
        hurtDisplayType = HURT_NUM_ENUM.INVINCIBLE
      elseif true == hurtExtraParams.immune then
        hurtDisplayType = HURT_NUM_ENUM.IMMUNE
      elseif hurtExtraParams.absorbHurt and hurtExtraParams.absorbHurt > 0 then
        hurtDisplayType = HURT_NUM_ENUM.ABSORB_HURT
      end
    end
    if 0 ~= realNum then
      local isAlive = defUnit:GetHp() > 0
      defUnit:ChangeAttr(ATTR_ENUM.hp, -realNum)
      defUnit:UpdateTempHpPer()
      if isAlive and realNum > 0 and attackUnit and attackUnit.camp ~= defUnit.camp then
        local uid = attackUnit.uid
        if attackUnit.summonId ~= nil then
          uid = attackUnit.summonFromUnit
        end
        if defUnit:GetHp() <= 0 then
          defUnit.lastKillSelfUnitUid = uid
        end
        defUnit.lastDamageSelfUnitUid = uid
      end
    end
    if BattleMgr.isBattleServer == false then
      t_insert(defUnit.savedHurtDisplayList, 1, {
        attackUnitUid = attackUnit and attackUnit.uid,
        num = num,
        displayType = hurtDisplayType,
        hurtEffectParams = hurtEffectParams,
        hurtExtraParams = hurtExtraParams,
        hurtEffectFlip = hurtEffectFlip
      })
    end
    if 0 ~= realNum then
      BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HP_CHANGE)
      if realNum > 0 then
        BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HP_LOSS_PER)
      elseif realNum < 0 then
        BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HP_ADD, nil, {
          hpAdd = -realNum
        })
      end
    end
  end
  return realNum
end

function BattleAction.DealRageChange(battleUnit, num)
  if num then
    local curRage = battleUnit:GetRage()
    if num > 0 then
      if battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_RAGE_ADD) == true then
        return
      end
      local maxRage = battleUnit:GetAttr(ATTR_ENUM.max_rage)
      if maxRage < curRage + num then
        num = maxRage - curRage
      end
      battleUnit:ChangeAttr(ATTR_ENUM.rage, num)
    elseif num < 0 then
      if curRage + num < 0 then
        num = -curRage
      end
      if num < 0 then
        battleUnit:ChangeAttr(ATTR_ENUM.rage, num)
      end
    end
    if BattleMgr.isBattleServer == false then
      t_insert(battleUnit.savedRageDisplayList, 1, {num = num})
    end
  end
end

function BattleAction.DealBuffSettle(battleUnit, buff)
  local effectList = buff.effectList
  local effectConfig, v
  for i = 1, #effectList do
    v = effectList[i]
    effectConfig = TableData.GetConfig(v.effectId, "BaseSkillBuffEffect")
    if effectConfig then
      if 1 ~= buff.buffConfig.not_show_icon and effectConfig.words_path then
        t_insert(battleUnit.savedBuffWordsDisplayList, 1, {
          path = effectConfig.words_path
        })
      end
      if effectConfig.effect_path then
        t_insert(battleUnit.savedBuffEffectDisplayList, 1, {
          name = string.format("effect_%s_%s", v.effectId, buff.uid),
          path = EffectUtil.GetFullPath(effectConfig.effect_path),
          type = BATTLE_OPERATION_TYPE.ADD,
          bindName = effectConfig.effect_bind_name
        })
      end
      if effectConfig.warn_effect then
        local buffConfig = buff.buffConfig
        local strList = Split(effectConfig.warn_effect, ":")
        local totalFrame = tonumber(strList[2]) - tonumber(strList[1])
        BattleActionDisplay.AddWaitDealWarningEffect(battleUnit, strList[3], 1, buffConfig.range_type, buffConfig.range_x, buffConfig.range_y, 1, totalFrame)
      end
    end
  end
end

function BattleAction.DealBuffRemove(battleUnit, buff)
  local effectList = buff.effectList
  local effectConfig, v
  for i = 1, #effectList do
    v = effectList[i]
    effectConfig = TableData.GetConfig(v.effectId, "BaseSkillBuffEffect")
    if effectConfig then
      if effectConfig.effect_path then
        t_insert(battleUnit.savedBuffEffectDisplayList, 1, {
          name = string.format("effect_%s_%s", v.effectId, buff.uid),
          type = BATTLE_OPERATION_TYPE.DEL
        })
      end
      if effectConfig.warn_effect then
        local strList = Split(effectConfig.warn_effect, ":")
        battleUnit:RemoveEffect(strList[3] .. "_" .. 1, true)
      end
    end
  end
end

function BattleAction.DealCheckSkill(battleUnit, targetUid)
  local curSkillId = battleUnit.curSkill.id
  local curSkillType = battleUnit.curSkill.type
  if nil == curSkillId and nil == curSkillType then
    local skillList = battleUnit.oriSkillList or {}
    local loopSkillList = battleUnit.loopSkillList or {}
    local index = battleUnit.curSkillIndex
    local skillListCount = #skillList
    local loopSkillListCount = #loopSkillList
    local count
    if index <= skillListCount then
      count = skillListCount + loopSkillListCount - index + 1
    else
      count = loopSkillListCount
    end
    local skillLevelUpConfig, targetUnitList, targetUidList
    for i = 1, count do
      if index <= skillListCount then
        curSkillId = skillList[index]
      else
        curSkillId = loopSkillList[index - skillListCount]
      end
      curSkillType = TableData.GetConfig(curSkillId, "BaseSkill").type
      if curSkillType == BATTLE_SKILL_ENUM.NORMAL and battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_NORMAL) == false or curSkillType == BATTLE_SKILL_ENUM.SMALL and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SMALL) or curSkillType == BATTLE_SKILL_ENUM.UNIQUE and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SKILL) or curSkillType == BATTLE_SKILL_ENUM.EX and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_EX) then
        battleUnit:SetAttackTargetUid(targetUid)
        battleUnit:SetMoveTargetUid(targetUid)
        if battleUnit.curState ~= BATTLE_STATE_ENUM.MOVE and battleUnit.curState ~= BATTLE_STATE_ENUM.STAND then
          return
        end
        battleUnit.curSkill.type = curSkillType
        battleUnit.curSkill.id = curSkillId
        skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(curSkillId)
        if skillLevelUpConfig and skillLevelUpConfig.target_type then
          targetUnitList = BattleChoose.GetSkillTargetUnitList({
            unitUid = battleUnit.uid
          }, {}, skillLevelUpConfig)
          targetUidList = BattleScene.GetUidListByUnitList(targetUnitList)
          battleUnit.skillTargetUidList = targetUidList
        end
      else
        curSkillId = nil
        curSkillType = nil
      end
      index = index + 1
      if index > skillListCount + loopSkillListCount then
        index = skillListCount + 1
      end
      battleUnit.curSkillIndex = index
      if curSkillId and curSkillType then
        print_battle("----------------队列技能-------------", BattleControl.curFixedFrame, battleUnit.positionIndex, battleUnit:GetName(), "技能id:", curSkillId, " 目标:", table.concat(targetUidList or {}, ","))
        return curSkillId, curSkillType
      end
    end
  end
  return curSkillId, curSkillType
end

function BattleAction.DealTriggerPassiveSkill(battleUnit, specificCondition, skillList, triggerFromUnitUid)
  local skillLevelUpConfig, isTrigger, skillId, skillTargetUidList, skill
  local IsSkillWaitFunc = BattleSkillWait.IsSkillWait
  local DealTriggerSkillConditionFunc = BattleAction.DealTriggerSkillCondition
  local DealUnitSkillFunc = BattleAction.DealUnitSkill
  for i = 1, #skillList do
    skill = skillList[i]
    if skill.enable == true and IsSkillWaitFunc(battleUnit.uid, skill.skillId) == false then
      skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(skill.skillId, skill.level)
      isTrigger, skillId, skillTargetUidList = DealTriggerSkillConditionFunc(battleUnit, skill.skillId, skillLevelUpConfig, specificCondition, triggerFromUnitUid)
      if true == isTrigger then
        DealUnitSkillFunc(battleUnit, skillId, skillLevelUpConfig, skillTargetUidList, false, specificCondition, triggerFromUnitUid)
      end
    end
  end
end

function BattleAction.DealTriggerBurstSkill(battleUnit)
  local skillId = battleUnit.burstSkill
  if battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_EX) == true then
    BattleSkillWait.AddSkill(battleUnit.uid, skillId, {})
    return
  end
  BattleSkillWait.AddSkill(battleUnit.uid, skillId, {})
end

function BattleAction.DealTriggerSkill(battleUnit, specificCondition, skillList, triggerFromUnitUid)
  local skillLevelUpConfig, baseConfig, isTrigger, skillId, skillTargetUidList
  local alreadyTriggerSkillHaveShowId = false
  local skill, showConfig, showId
  local IsSkillWaitFunc = BattleSkillWait.IsSkillWait
  local DealTriggerSkillConditionFunc = BattleAction.DealTriggerSkillCondition
  local DealUnitSkillFunc = BattleAction.DealUnitSkill
  for i = 1, #skillList do
    skill = skillList[i]
    if skill.enable == true and IsSkillWaitFunc(battleUnit.uid, skill.skillId) == false then
      baseConfig = TableData.GetConfig(skill.skillId, "BaseSkill")
      if specificCondition == TRIGGER_CONDITION.SELF_DYING or specificCondition == TRIGGER_CONDITION.RAGE_NEED or baseConfig.type == BATTLE_SKILL_ENUM.EX and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_EX) or baseConfig.type == BATTLE_SKILL_ENUM.UNIQUE and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SKILL) or baseConfig.type == BATTLE_SKILL_ENUM.SMALL and false == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SMALL) then
        skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(skill.skillId, skill.level)
        showConfig, showId = battleUnit:GetSkillShowConfig(skill.skillId)
        if alreadyTriggerSkillHaveShowId and showId then
        else
          isTrigger, skillId, skillTargetUidList = DealTriggerSkillConditionFunc(battleUnit, skill.skillId, skillLevelUpConfig, specificCondition, triggerFromUnitUid)
          if true == isTrigger then
            DealUnitSkillFunc(battleUnit, skillId, skillLevelUpConfig, skillTargetUidList, false, specificCondition)
            if showId then
              alreadyTriggerSkillHaveShowId = true
            end
          end
        end
      end
    end
  end
end

function BattleAction.DealUnitSkill(battleUnit, skillId, skillLevelUpConfig, skillTargetUidList, isFromSkillWait, specificCondition, triggerFromUnitUid)
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  local curSkillType = skillConfig.type
  if true == isFromSkillWait and (curSkillType == BATTLE_SKILL_ENUM.SMALL and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SMALL) or curSkillType == BATTLE_SKILL_ENUM.UNIQUE and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SKILL) or curSkillType == BATTLE_SKILL_ENUM.EX and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_EX) or curSkillType == BATTLE_SKILL_ENUM.BURST_CARD and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_BURST)) then
    return false
  end
  local condition, triggerValue, triggerType, triggerCount, triggerRandom
  local showConfig, showId = battleUnit:GetSkillShowConfig(skillId)
  if curSkillType == BATTLE_SKILL_ENUM.PASSIVE and nil == showId or curSkillType == BATTLE_SKILL_ENUM.LEADER then
    local curSkill = {
      id = skillId,
      type = curSkillType,
      isTrigger = true
    }
    battleUnit:SaveTriggerSkill(curSkill)
    if skillLevelUpConfig.buff_list then
      local extraParams
      if triggerFromUnitUid then
        extraParams = {triggerFromUnitUid = triggerFromUnitUid}
      end
      BattleBuffMgr.GetAllBuff(skillLevelUpConfig, {
        unitUid = battleUnit.uid
      }, nil, true, extraParams)
    end
    if skillLevelUpConfig.trigger_buff_list then
      local loop = skillLevelUpConfig.trigger_buff_list_loop
      local count = battleUnit:GetSkillAlreadyTriggerCount(curSkill.id)
      local curBuffStr, buffStrIndex
      if 1 == loop then
        buffStrIndex = count % #skillLevelUpConfig.trigger_buff_list
        if 0 == buffStrIndex then
          buffStrIndex = #skillLevelUpConfig.trigger_buff_list
        end
      elseif buffStrIndex > #skillLevelUpConfig.trigger_buff_list then
        buffStrIndex = #skillLevelUpConfig.trigger_buff_list
      end
      curBuffStr = skillLevelUpConfig.trigger_buff_list[buffStrIndex]
      if curBuffStr and "" ~= curBuffStr then
        BattleBuffMgr.AnalysisBuffList({curBuffStr}, {
          unitUid = battleUnit.uid,
          cardSkillId = skillId
        }, {})
      end
    end
  else
    if curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
      if showId then
        local curState = battleUnit.curState
        if (curState == BATTLE_STATE_ENUM.WAIT_ATTACK or curState == BATTLE_STATE_ENUM.ATTACK or curState == BATTLE_STATE_ENUM.ATTACK_OVER) and battleUnit.curSkill.type ~= BATTLE_SKILL_ENUM.NORMAL then
          return false
        end
      end
    elseif specificCondition == TRIGGER_CONDITION.RAGE_NEED then
      local curState = battleUnit.curState
      if curState == BATTLE_STATE_ENUM.BEAT_BACK or curState == BATTLE_STATE_ENUM.DEVOUR or curState == BATTLE_STATE_ENUM.WAIT_ATTACK or curState == BATTLE_STATE_ENUM.ATTACK or curState == BATTLE_STATE_ENUM.ATTACK_OVER then
        return false
      end
    end
    if true == isFromSkillWait and nil == battleUnit.skillIdList[skillId] then
      return true
    end
    local curSkill = {
      id = skillId,
      type = curSkillType,
      isTrigger = true
    }
    if isFromSkillWait then
      if curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
        local attackTargetUid = battleUnit:GetAttackTargetUid()
        if nil == attackTargetUid then
          local curTarget
          local nearestUnitList = BattleChoose.GetUnitForChooseMoveTarget(battleUnit)
          if battleUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
            local v
            for i = 1, #nearestUnitList do
              v = nearestUnitList[i]
              if v.isSupportOrRanged then
                curTarget = v
                break
              end
            end
          end
          if curTarget then
            battleUnit.attackTargetUid = curTarget.uid
          else
            battleUnit.attackTargetUid = nearestUnitList[1] and nearestUnitList[1].uid
          end
        end
        local targetUnitList = BattleChoose.GetSkillTargetUnitList({
          unitUid = battleUnit.uid
        }, {}, skillLevelUpConfig)
        if 0 == #targetUnitList then
          return false
        end
        skillTargetUidList = BattleScene.GetUidListByUnitList(targetUnitList)
      else
        local ignoreTargetInRange = BattleAction.IsIgnoreTargetInRange(battleUnit, skillId)
        if true ~= ignoreTargetInRange then
          local needReChoose = false
          for _, uid in ipairs(skillTargetUidList) do
            local unit = BattleScene.GetUnitByUid(uid)
            if unit.isGrid then
              needReChoose = false
              break
            elseif unit:IsAlive() == false then
              needReChoose = true
              break
            end
          end
          if needReChoose then
            local attackTargetUid = battleUnit:GetAttackTargetUid()
            if nil == attackTargetUid then
              local curTarget
              local nearestUnitList = BattleChoose.GetUnitForChooseMoveTarget(battleUnit)
              if battleUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
                local v
                for i = 1, #nearestUnitList do
                  v = nearestUnitList[i]
                  if v.isSupportOrRanged then
                    curTarget = v
                    break
                  end
                end
              end
              if curTarget then
                battleUnit.attackTargetUid = curTarget.uid
              else
                battleUnit.attackTargetUid = nearestUnitList[1] and nearestUnitList[1].uid
              end
            end
            local targetUnitList = BattleChoose.GetSkillTargetUnitList({
              unitUid = battleUnit.uid
            }, {}, skillLevelUpConfig)
            skillTargetUidList = BattleScene.GetUidListByUnitList(targetUnitList)
          end
        end
      end
    end
    if curSkillType ~= BATTLE_SKILL_ENUM.BURST_CARD then
      condition, triggerValue, triggerType, triggerCount, triggerRandom = battleUnit:GetSkillLevelUpTriggerParam(skillId, skillLevelUpConfig, specificCondition)
      if true ~= isFromSkillWait and triggerRandom and triggerRandom < BattleData.GetRandomSeed() then
        return false
      end
      if condition == TRIGGER_CONDITION.RAGE_NEED then
        if true == isFromSkillWait and triggerValue > battleUnit:GetRage() then
          return true
        end
        if triggerType == COMPARE_TYPE.EQUAL then
          BattleAction.DealRageChange(battleUnit, -triggerValue)
        elseif triggerType == COMPARE_TYPE.GREATER_EQUAL then
          BattleAction.DealRageChange(battleUnit, -battleUnit:GetRage())
        end
      end
    end
    if showId then
      if battleUnit.curState == BATTLE_STATE_ENUM.ATTACK then
        BattleAction.ForceChangeState(battleUnit, nil, true)
      end
      battleUnit.curSkill = curSkill
      battleUnit.skillTargetUidList = skillTargetUidList
      battleUnit.waitAttackFrame = 0
    end
    battleUnit:SaveTriggerSkill(curSkill)
    if skillLevelUpConfig.buff_list then
      BattleBuffMgr.GetAllBuff(skillLevelUpConfig, {
        unitUid = battleUnit.uid,
        cardSkillId = skillId
      }, skillTargetUidList)
    end
    if skillLevelUpConfig.trigger_buff_list then
      local loop = skillLevelUpConfig.trigger_buff_list_loop
      local count = battleUnit:GetSkillAlreadyTriggerCount(curSkill)
      local curBuffStr, buffStrIndex
      if 1 == loop then
        buffStrIndex = count % #skillLevelUpConfig.trigger_buff_list
        if 0 == buffStrIndex then
          buffStrIndex = #skillLevelUpConfig.trigger_buff_list
        end
      elseif buffStrIndex > #skillLevelUpConfig.trigger_buff_list then
        buffStrIndex = #skillLevelUpConfig.trigger_buff_list
      end
      curBuffStr = skillLevelUpConfig.trigger_buff_list[buffStrIndex]
      if curBuffStr and "" ~= curBuffStr then
        BattleBuffMgr.AnalysisBuffList({curBuffStr}, {
          unitUid = battleUnit.uid,
          cardSkillId = skillId
        }, {})
      end
    end
    if showId then
      BattleAction.ClearAttackInfo(battleUnit)
      battleUnit:SetState(BATTLE_STATE_ENUM.ATTACK)
    else
      BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BEFORE_ATTACK, BUFF_SETTLE_TYPE.BEFORE_ATTACK)
      if curSkillType == BATTLE_SKILL_ENUM.NORMAL then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BEFORE_NORMAL_ATTACK, BUFF_SETTLE_TYPE.BEFORE_NORMAL_ATTACK)
      elseif curSkillType == BATTLE_SKILL_ENUM.SMALL then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BEFORE_SMALL_SKILL, BUFF_SETTLE_TYPE.BEFORE_SMALL_SKILL)
      elseif curSkillType == BATTLE_SKILL_ENUM.UNIQUE then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BEFORE_UNIQUE_SKILL, BUFF_SETTLE_TYPE.BEFORE_UNIQUE_SKILL)
      elseif curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
        BattleBuffMgr.TriggerUnitListener(battleUnit, BUFF_DEDUCE_TYPE.BEFORE_BURST_SKILL, BUFF_SETTLE_TYPE.BEFORE_BURST_SKILL)
      end
    end
    if curSkillType == BATTLE_SKILL_ENUM.BURST_CARD then
      if false == BattleMgr.isBattleServer then
        BattleScene.PlayBurstSkill(true, battleUnit)
      end
      local burst = BattleScene.GetBurst(battleUnit.camp)
      if burst then
        burst:ResetCardBurstWaitFrame()
      end
    end
  end
  if skillLevelUpConfig.summon_id then
    local pos
    local index = triggerCount or battleUnit:GetSkillAlreadyTriggerCount(skillId)
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
      local param = {
        summonId = tonumber(summon_id_list[i]),
        camp = battleUnit.camp,
        pos = pos,
        state = BATTLE_STATE_ENUM.START,
        summonFromUnit = battleUnit.uid
      }
      BattleAction.DealSummon(param, i == #summon_id_list)
    end
  end
  if skillLevelUpConfig.summon_group then
    local index = triggerCount or battleUnit:GetSkillAlreadyTriggerCount(skillId)
    if BattleData.scoreInfo and battleUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
      local curFixedTime = BattleControl.curFixedFrame
      for i, v in ipairs(BattleData.scoreInfo) do
        if curFixedTime < v.maxFrame and curFixedTime >= v.minFrame then
          v.curWave = index
          break
        end
      end
    end
    local isLoop = skillLevelUpConfig.loop
    local summonStr
    if 1 == isLoop then
      index = index % #skillLevelUpConfig.summon_group
      if 0 == index then
        index = #skillLevelUpConfig.summon_group
      end
      summonStr = skillLevelUpConfig.summon_group[index]
    else
      summonStr = skillLevelUpConfig.summon_group[index] or skillLevelUpConfig.summon_group[#skillLevelUpConfig.summon_group]
    end
    if summonStr then
      local strList = Split(summonStr, ":")
      for _, groupStr in ipairs(strList) do
        local groupId = tonumber(groupStr)
        local groupConfig = TableData.GetConfig(groupId, "BaseSkillSummonGroup")
        if groupConfig then
          local summonIdList = groupConfig.summon_id
          local summonSiteList = groupConfig.summon_site
          for i = 1, #summonIdList do
            local param = {
              summonId = summonIdList[i],
              camp = battleUnit.camp,
              pos = summonSiteList[i],
              state = BATTLE_STATE_ENUM.START,
              summonFromUnit = battleUnit.uid
            }
            if groupConfig.summon_delay[i] > 0 then
              BattleSummonWait.AddSummon(param, groupConfig.summon_delay[i])
            else
              BattleAction.DealSummon(param)
            end
          end
        end
      end
    end
  end
  return true
end

function BattleAction.DealTriggerSkillCondition(battleUnit, skillId, skillLevelUpConfig, specificCondition, triggerFromUnitUid)
  if specificCondition == TRIGGER_CONDITION.SELF_DYING then
    if battleUnit:IsDying() == false then
      return false, nil
    end
  elseif battleUnit:IsDying() == true then
    return false, nil
  end
  if skillLevelUpConfig.trigger_limit then
    local triggerCount = battleUnit:GetSkillAlreadyTriggerCount(skillId)
    local index = triggerCount + 1
    local limit = skillLevelUpConfig.trigger_limit[index] or skillLevelUpConfig.trigger_limit[#skillLevelUpConfig.trigger_limit]
    local triggerType = skillLevelUpConfig.trigger_limit_type[index] or skillLevelUpConfig.trigger_limit_type[#skillLevelUpConfig.trigger_limit_type]
    local triggerValue = skillLevelUpConfig.trigger_limit_value[index] or skillLevelUpConfig.trigger_limit_value[#skillLevelUpConfig.trigger_limit_value]
    local value
    if limit == TRIGGER_LIMIT.TIME then
      value = BattleControl.curFixedFrame
    end
    if value and false == CompareNum(triggerType, value, triggerValue) then
      return false, nil
    end
  end
  local value = 0
  local condition, triggerValue, triggerType, triggerCount, triggerRandom = battleUnit:GetSkillLevelUpTriggerParam(skillId, skillLevelUpConfig, specificCondition)
  if triggerRandom and triggerRandom < BattleData.GetRandomSeed() then
    return false
  end
  if condition == TRIGGER_CONDITION.RAGE_NEED then
    value = battleUnit:GetRage()
    if triggerValue > value then
      return false, nil
    end
  end
  local rightNow = false
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  local triggerMax = skillLevelUpConfig.trigger_max
  if triggerMax then
    triggerCount = triggerCount or battleUnit:GetSkillAlreadyTriggerCount(skillId)
    if skillConfig.type == SKILL_TYPE_ENUM.SMALL then
      triggerMax = triggerMax + battleUnit.smallSkillTriggerMaxChange
    end
    if triggerCount >= triggerMax then
      battleUnit:RemoveSkillTrigger(specificCondition, skillId)
      return false, nil
    end
  end
  if skillLevelUpConfig.trigger_cd then
    local lastTriggerFrame = battleUnit:GetLastFrameBySkillId(skillId)
    if 0 ~= lastTriggerFrame and skillLevelUpConfig.trigger_cd > BattleControl.curFixedFrame - lastTriggerFrame then
      return false, nil
    end
  end
  if condition == TRIGGER_CONDITION.SELF_HURT_MORE then
    value = MathUtil.TruncateFloat(10000 * battleUnit.curHurt / battleUnit:GetAttr(ATTR_ENUM.max_hp))
    rightNow = true
  elseif condition == TRIGGER_CONDITION.BATTLE_START then
    value = BattleControl.curFixedFrame
    triggerValue = 0
    rightNow = true
  elseif condition == TRIGGER_CONDITION.BEFORE_ATTACK then
    value = battleUnit:GetNormalSkillCountSinceLastSkill(skillId)
  elseif condition == TRIGGER_CONDITION.BEFORE_ATTACK_RANDOM then
    value = BattleData.GetRandomSeed()
  elseif condition == TRIGGER_CONDITION.FIRST_ATTACK then
    value = 1
    rightNow = true
  elseif condition == TRIGGER_CONDITION.AFTER_ATTACK then
    value = battleUnit:GetNormalSkillCountSinceLastSkill(skillId)
  elseif condition == TRIGGER_CONDITION.RAGE_NEED then
    value = battleUnit:GetRage()
    if triggerType == COMPARE_TYPE.EQUAL then
      triggerType = COMPARE_TYPE.GREATER_EQUAL
    end
  elseif condition == TRIGGER_CONDITION.SELF_DYING then
    battleUnit:ClearControlState()
    value = 1
    print_battle("死亡时触发技能")
    battleUnit.skillWhenDying = true
  elseif condition == TRIGGER_CONDITION.CHANGE_ATTACK_TARGET then
    rightNow = true
    value = 1
  elseif condition == TRIGGER_CONDITION.MOVE_DISTANCE then
    rightNow = true
    triggerCount = triggerCount or battleUnit:GetSkillAlreadyTriggerCount(skillId)
    value = battleUnit.totalMove - triggerCount * triggerValue
  elseif condition == TRIGGER_CONDITION.SELF_HP_LOSS_PER then
    triggerCount = triggerCount or battleUnit:GetSkillAlreadyTriggerCount(skillId)
    local totalLossPer = MathUtil.TruncateFloat(10000 * battleUnit.totalHurt / battleUnit:GetBaseAttr(ATTR_ENUM.max_hp))
    value = totalLossPer - triggerCount * triggerValue
  elseif condition == TRIGGER_CONDITION.SELF_HP_PER then
    local curHp = battleUnit:GetHp()
    if curHp <= 0 then
      return false, nil
    end
    value = MathUtil.TruncateFloat(10000 * curHp / battleUnit:GetAttr(ATTR_ENUM.max_hp))
  elseif condition == TRIGGER_CONDITION.SELF_HP_PER_WITH_SUMMON then
    if false == battleUnit:IsSummonAlive() then
      return false, nil
    end
    local curHp = battleUnit:GetHp()
    if curHp <= 0 then
      return false, nil
    end
    value = MathUtil.TruncateFloat(10000 * curHp / battleUnit:GetAttr(ATTR_ENUM.max_hp))
  elseif condition == TRIGGER_CONDITION.SPECIAL_AFTER_SWORD then
    value = 1
    rightNow = true
  elseif condition == TRIGGER_CONDITION.TIME_LOOP then
    triggerValue = triggerValue * BATTLE_CONFIG_ENUM.FIXED_FPS
    value = BattleControl.curFixedFrame - battleUnit:GetLastFrameBySkillId(skillId)
  elseif condition == TRIGGER_CONDITION.TIME_FIXED then
    triggerValue = triggerValue * BATTLE_CONFIG_ENUM.FIXED_FPS
    value = BattleControl.curFixedFrame
  elseif condition == TRIGGER_CONDITION.FRAME_FIXED then
    value = BattleControl.curFixedFrame
  elseif condition == TRIGGER_CONDITION.TIME_LOOP_FIRST_ATTACK then
    if battleUnit.savedFirstAttackFrame == nil then
      return false, nil
    else
      triggerValue = triggerValue * BATTLE_CONFIG_ENUM.FIXED_FPS
      local lastFrame = battleUnit:GetLastFrameBySkillId(skillId)
      if 0 == lastFrame then
        value = BattleControl.curFixedFrame - battleUnit.savedFirstAttackFrame
      else
        value = BattleControl.curFixedFrame - lastFrame
      end
    end
  elseif condition == TRIGGER_CONDITION.PARTNER_HP_LOSS then
    local minHpUnit = BattleChoose.GetMinHpPerUnit(battleUnit)
    if minHpUnit then
      value = 10000 * minHpUnit.tempHpPer
    else
      return false, nil
    end
  elseif condition == TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543 then
    local minHpUnit = BattleChoose.GetMinHpPerUnit(battleUnit)
    if minHpUnit then
      local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(battleUnit, BUFF_EFFECT_ID.HP_RESTORE)
      if count > 0 then
        value = 10000 * minHpUnit.tempHpPer
        rightNow = true
      else
        return false, nil
      end
    else
      return false, nil
    end
  elseif condition == TRIGGER_CONDITION.PARTNER_RANGED_HP_LOSS then
    local minHpUnit = BattleChoose.GetMinHpPerUnit(battleUnit, BATTLE_UNIT_TYPE.RANGED_ATTACK)
    if minHpUnit then
      value = 10000 * minHpUnit.tempHpPer
    else
      return false, nil
    end
  elseif condition == TRIGGER_CONDITION.PARTNER_DYING then
    value = 1
    rightNow = true
  elseif condition == TRIGGER_CONDITION.PARTNER_NO_SUMMON then
    local selfCampUnitList = BattleChoose.GetUnitListBySide(battleUnit, true, nil, nil, nil, nil, nil, true)
    for i = 1, #selfCampUnitList do
      if selfCampUnitList[i].summonId then
        return false, nil
      end
    end
  elseif condition == TRIGGER_CONDITION.PARTNER_SUMMON_LESS_EQUAL then
    local selfCampUnitList = BattleChoose.GetUnitListBySide(battleUnit, true, nil, nil, nil, nil, nil, true)
    local summonList = BattleChoose.GetSummonUnit(selfCampUnitList)
    value = #summonList
  elseif condition == TRIGGER_CONDITION.BURST_START then
    value = 1
    rightNow = true
  elseif condition == TRIGGER_CONDITION.ENEMY_DEAD then
    value = 1
    rightNow = true
  else
    return false, nil
  end
  local baseConfig = TableData.GetConfig(skillId, "BaseSkill")
  if baseConfig.type == BATTLE_SKILL_ENUM.PASSIVE or baseConfig.type == BATTLE_SKILL_ENUM.LEADER then
  elseif false == rightNow and battleUnit.curState == BATTLE_STATE_ENUM.MOVE then
    return false, nil
  end
  if true == CompareNum(triggerType, value, triggerValue) then
    local targetUnitList = BattleChoose.GetSkillTargetUnitList({
      unitUid = battleUnit.uid
    }, {}, skillLevelUpConfig, {triggerFromUnitUid = triggerFromUnitUid})
    local targetUidList = BattleScene.GetUidListByUnitList(targetUnitList)
    if 1 == skillLevelUpConfig.not_fixed_target then
    elseif #targetUidList <= 0 then
      return false, nil
    end
    print_battle("----------------触发技能-------------", BattleControl.curFixedFrame, battleUnit.positionIndex, battleUnit:GetName(), "技能id:", skillId, " 目标:", table.concat(targetUidList, ","))
    local needWait = false
    local configType = baseConfig.type
    if condition == TRIGGER_CONDITION.PARTNER_HP_LOSS_AND_543 then
      BattleBuffMgr.ClearBuffByEffectId(battleUnit, BUFF_EFFECT_ID.HP_RESTORE, 1)
    end
    if condition == TRIGGER_CONDITION.RAGE_NEED then
      if battleUnit.curState == BATTLE_STATE_ENUM.WAIT_ATTACK or battleUnit.curState == BATTLE_STATE_ENUM.ATTACK or battleUnit.curState == BATTLE_STATE_ENUM.ATTACK_OVER or configType == BATTLE_SKILL_ENUM.UNIQUE and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SKILL) or configType == BATTLE_SKILL_ENUM.SMALL and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_SMALL) or configType == BATTLE_SKILL_ENUM.EX and true == battleUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_EX) then
        needWait = true
      end
    elseif configType == BATTLE_SKILL_ENUM.UNIQUE and battleUnit.curSkill.type == BATTLE_SKILL_ENUM.UNIQUE then
      needWait = true
    elseif configType == BATTLE_SKILL_ENUM.EX and battleUnit.curSkill.type == BATTLE_SKILL_ENUM.UNIQUE then
      needWait = true
    elseif battleUnit.curSkill.type == BATTLE_SKILL_ENUM.EX then
      needWait = true
    end
    if true == needWait then
      BattleSkillWait.AddSkill(battleUnit.uid, skillId, targetUidList, specificCondition)
      return false, nil
    else
      return true, skillId, targetUidList
    end
  end
end

function BattleAction.IsIgnoreTargetInRange(battleUnit, skillId)
  if battleUnit and skillId then
    local skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(skillId)
    if skillLevelUpConfig and (skillLevelUpConfig.range_type and skillLevelUpConfig.range_x or skillLevelUpConfig.not_fixed_target) then
      return true
    end
  end
  return false
end

function BattleAction.InitBeatBackUnitData(battleUnit, fromUnit, buffConfig)
  local totalFrames = buffConfig.beat_back_frames[battleUnit.battleUnitType]
  battleUnit.beatBackFrames = math.ceil(totalFrames * MathUtil.TruncateFloat(100 / battleUnit.weight))
  local dis = MathUtil.TruncateFloat(buffConfig.beat_back_distance[battleUnit.battleUnitType] / BattleScene.pixelsPerUnit) * MathUtil.TruncateFloat(100 / battleUnit.weight)
  local beatBackDis = {
    x = 0,
    y = 0,
    z = 0
  }
  local disX = fromUnit.position.x - battleUnit.position.x
  local disY = fromUnit.position.y - battleUnit.position.y
  local disZ = fromUnit.position.z - battleUnit.position.z
  local spd = math.sqrt(disX ^ 2 + disY ^ 2 + disZ ^ 2)
  if 0 ~= spd then
    beatBackDis.x = MathUtil.TruncateFloat(-dis * disX / spd)
    beatBackDis.y = MathUtil.TruncateFloat(-dis * disY / spd)
    beatBackDis.z = MathUtil.TruncateFloat(-dis * disZ / spd)
  else
    if battleUnit.camp == BATTLE_CAMP_FLAG.LEFT then
      beatBackDis.x = -dis
    elseif battleUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
      beatBackDis.x = dis
    end
    beatBackDis.y = 0
    beatBackDis.z = 0
  end
  battleUnit.beatBackPerFrame = {
    x = MathUtil.TruncateFloat(beatBackDis.x / totalFrames),
    y = MathUtil.TruncateFloat(beatBackDis.y / totalFrames),
    z = MathUtil.TruncateFloat(beatBackDis.z / totalFrames)
  }
end

function BattleAction.InitDevourUnitData(battleUnit, fromUnit, buffConfig)
  local totalFrames = math.ceil(buffConfig.beat_back_frames[battleUnit.battleUnitType] * MathUtil.TruncateFloat(100 / battleUnit.weight))
  battleUnit.devourFrames = totalFrames
  local pixelsPerUnit = BattleScene.pixelsPerUnit
  local dis = MathUtil.TruncateFloat(buffConfig.beat_back_distance[battleUnit.battleUnitType] / pixelsPerUnit) * MathUtil.TruncateFloat(100 / battleUnit.weight)
  local beatBackDis = {
    x = 0,
    y = 0,
    z = 0
  }
  local disX = fromUnit.position.x - battleUnit.position.x
  local disY = fromUnit.position.y - battleUnit.position.y
  local disZ = fromUnit.position.z - battleUnit.position.z
  local spd = math.sqrt(disX ^ 2 + disY ^ 2 + disZ ^ 2)
  if buffConfig.swallow_range and buffConfig.swallow_range >= spd * pixelsPerUnit then
    battleUnit.devourPerFrame = {
      x = 0,
      y = 0,
      z = 0
    }
    return
  end
  if 0 ~= spd then
    beatBackDis.x = MathUtil.TruncateFloat(dis * disX / spd)
    beatBackDis.y = MathUtil.TruncateFloat(dis * disY / spd)
    beatBackDis.z = MathUtil.TruncateFloat(dis * disZ / spd)
  end
  battleUnit.devourPerFrame = {
    x = MathUtil.TruncateFloat(beatBackDis.x / totalFrames),
    y = MathUtil.TruncateFloat(beatBackDis.y / totalFrames),
    z = MathUtil.TruncateFloat(beatBackDis.z / totalFrames)
  }
end

function BattleAction.InitFearUnitData(battleUnit, buffConfig)
end

function BattleAction.DealMoveToAttack(attackUnit, hurtUnit)
  local moveTargetUid = hurtUnit:GetMoveTargetUid()
  if moveTargetUid == attackUnit.uid then
    return
  end
  local curState = hurtUnit.curState
  if curState == BATTLE_STATE_ENUM.MOVE and attackUnit.camp == hurtUnit.enemyCamp then
    if nil == moveTargetUid then
      hurtUnit:SetMoveTargetUid(attackUnit.uid)
    else
      local distance = attackUnit.cachedDistance[hurtUnit.uid]
      local tempUnit = BattleScene.GetUnitByUid(moveTargetUid)
      local oldDistance = tempUnit.cachedDistance[hurtUnit.uid]
      if distance < oldDistance then
        hurtUnit:SetMoveTargetUid(attackUnit.uid)
      end
    end
  end
end

function BattleAction.UpdateModelFlipWhenAttack(battleUnit)
  if battleUnit.curState == BATTLE_STATE_ENUM.MOVE or battleUnit.curState == BATTLE_STATE_ENUM.WAIT_ATTACK or battleUnit.curState == BATTLE_STATE_ENUM.ATTACK then
    local speed = battleUnit.speed
    if speed.x > 0 then
      battleUnit:SetModelFlip(false)
    elseif speed.x < 0 then
      battleUnit:SetModelFlip(true)
    else
      local targetUid = battleUnit:GetAttackTargetUid()
      local target = BattleScene.GetUnitByUid(targetUid)
      if target then
        local position = battleUnit.position
        local targetPosition = target.position
        if targetPosition.x > position.x then
          battleUnit:SetModelFlip(false)
        elseif targetPosition.x < position.x then
          battleUnit:SetModelFlip(true)
        end
      end
    end
  end
end

function BattleAction.UpdateModelTimescale(battleUnit, forceUpdateDisplay)
  local timeScale
  if battleUnit.isFreeze == true or true == battleUnit.isPetrified or true == battleUnit.isTimePause then
    timeScale = 0
    battleUnit:SetModelTimeScale(timeScale, forceUpdateDisplay)
    return
  end
  if battleUnit.curState == BATTLE_STATE_ENUM.ATTACK and battleUnit.curSkill.type == BATTLE_SKILL_ENUM.NORMAL then
    local targetTimescale = timeScale or MathUtil.TruncateFloat(10000 / battleUnit.attackFrameScale)
    battleUnit:SetModelTimeScale(targetTimescale, forceUpdateDisplay)
  elseif battleUnit.curState == BATTLE_STATE_ENUM.MOVE then
    local targetTimescale = timeScale or (battleUnit.saveMoveSpeed or 0) / 100
    battleUnit:SetModelTimeScale(targetTimescale, forceUpdateDisplay)
  else
    local targetTimescale = timeScale or 1
    battleUnit:SetModelTimeScale(targetTimescale, forceUpdateDisplay)
  end
end
