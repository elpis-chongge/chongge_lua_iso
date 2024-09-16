BattleControl = {
  curFixedFrame = 0,
  curFrame = 0,
  isPause = false,
  uniqueSkillUnitUid = nil,
  delayStopBattleFrame = nil,
  timeSinceLastUpdate = 0,
  baseTimeScale = nil,
  timescaleSlowRatio = nil
}

function BattleControl.InitLocalVar()
end

function BattleControl.Init()
  BattleControl.curFixedFrame = 0
  BattleControl.curFrame = 0
  BattleControl.isPause = false
  BattleControl.isBurstPause = false
  BattleControl.isGuidePause = false
  BattleControl.uniqueSkillUnitUid = nil
  BattleControl.isOver = false
  BattleControl.battleStartEnable = false
  BattleControl.dealBuffPreCount = 0
  if Time then
    BattleControl.baseTimeScale = BattleData.speedList[BattleData.speedIndex]
    BattleControl.timescaleSlowRatio = nil
    BattleControl.timeSinceLastUpdate = 0
  end
  BattleControl.delayStopBattleFrame = BATTLE_CONFIG_ENUM.DEFAULT_DYING_FRAMES + 10
  BattleControl.leftTotalDamage = 0
  BattleControl.leftSplitDamage = {}
end

local unitDamageInfoList, unitRecordList

function BattleControl.Start(delayClearScene)
  BattleScene.DealPreBattle()
  if BattleMgr.isBattleServer == true then
    local startTime = os.clock()
    local battleCostTime, totalLoop = 0, 0
    while true do
      BattleControl.UpdateProcess()
      totalLoop = totalLoop + 1
      if true == BattleControl.isOver then
        battleCostTime = i
        break
      end
    end
    if true ~= delayClearScene then
      BattleScene.Clear()
      print_server("战斗服 战斗结束，战斗时长", BattleControl.curFixedFrame, totalLoop)
      print_server("耗时", os.clock() - startTime, BattleData.GetRandomSeed())
    end
  else
    UpdateManager.AddFixedUpdateHandler(BattleControl.UpdateProcess)
    UpdateManager.AddUpdateHandler(BattleControl.UpdateDisplay)
  end
end

function BattleControl.UpdateProcess()
  if BattleControl.isPause == true then
    return
  end
  if BattleControl.battleStartEnable == false then
    BattleAction.DealBuffPre()
    return
  end
  if false == BattleMgr.isBattleServer and BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    local campRightUnitList = BattleScene.GetUnitListByCampDirect(BATTLE_CAMP_FLAG.RIGHT)
    local hp = 0
    for _, _unit in ipairs(campRightUnitList) do
      if _unit.summonId == nil then
        local config, isMonster = _unit:GetBaseConfig()
        if isMonster then
          if 1 ~= config.no_statistics_hp then
            hp = hp + _unit:GetHp()
          end
        else
          hp = hp + _unit:GetHp()
        end
      end
    end
    BattleData.curRightTotalHP = hp
  end
  if false == BattleScene.IsBattleOver() then
    local transformOK = BattleTransform.DealTransformWaitList()
    if transformOK then
      return
    end
    BattleSkillWait.DealSkillWaitList()
    BattleSummonWait.DealSummonWaitList()
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
      if true == BattleMgr.isBattleServer then
        BattleOperation.ChooseBurstSkill(BATTLE_CAMP_FLAG.RIGHT)
        BattleOperation.ChooseBurstSkill(BATTLE_CAMP_FLAG.LEFT)
      else
      end
    elseif true == BattleMgr.isBattleServer then
    else
      if BattleData.isAuto then
        BattleOperation.ChooseBurstSkill(BATTLE_CAMP_FLAG.LEFT)
      end
      BattleOperation.ChooseBurstSkill(BATTLE_CAMP_FLAG.RIGHT)
      if BattleData.isManuallySkillAuto then
        BattleOperation.ChooseManuallySkill(BATTLE_CAMP_FLAG.LEFT)
      end
    end
    local curFixedFrame = BattleControl.curFixedFrame
    curFixedFrame = curFixedFrame + 1
    BattleControl.curFixedFrame = curFixedFrame
    BattleOperation.DealOperationList()
    if true == BattleControl.isBurstPause then
      return
    end
  end
  BattleControl.UpdateProcess_2(BattleControl.curFixedFrame)
end

function BattleControl.UpdateProcess_2(curFixedFrame)
  if BattleScene.IsBattleOver() == false then
    BattleOperation.DealManuallyOperationList()
    BattleScene.UpdateProcess(curFixedFrame)
    BattleScene.UpdateBattleOverState()
  end
  if BattleScene.IsBattleOver() == true then
    local aliveUnitList = BattleScene.GetTempAliveUnitList()
    for i = 1, #aliveUnitList do
      BattleBuffMgr.TriggerUnitListener(aliveUnitList[i], BUFF_DEDUCE_TYPE.BATTLE_END)
    end
    BattleBuffMgr.TriggerCampListener(BATTLE_CAMP_FLAG.LEFT, BUFF_DEDUCE_TYPE.BATTLE_END)
    if true == BattleMgr.isBattleServer then
      if true == BattleScene.IsBattleLoss() then
        local bossUnit, skillShowId = BattleScene.GetBossHaveKOSkill()
        if bossUnit and skillShowId then
          aliveUnitList = BattleScene.GetTempAliveUnitList()
          for _, unit in ipairs(aliveUnitList) do
            if unit.camp == BATTLE_CAMP_FLAG.LEFT then
              unit:SetInitAttr(ATTR_ENUM.hp, 0)
            end
          end
        end
      end
      BattleControl.Stop()
    else
      for _, v in ipairs(aliveUnitList) do
        if v.curState == BATTLE_STATE_ENUM.MOVE then
          BattleAction.ForceChangeState(v, BATTLE_STATE_ENUM.STAND)
        end
      end
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BATTLE_STOP_UPDATE_SHOW)
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_PER_FRAME)
      if BattleControl.delayStopBattleFrame > 0 then
        BattleControl.delayStopBattleFrame = BattleControl.delayStopBattleFrame - 1
      elseif 0 == BattleControl.delayStopBattleFrame then
        BattleControl.delayStopBattleFrame = -1
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BATTLE_OVER)
      end
    end
  end
end

function BattleControl.UpdateDisplay()
  if BattleControl.isPause == true then
    return
  end
  BattleControl.curFrame = BattleControl.curFrame + 1
  BattleActionDisplay.DealWaitAction()
  BattleScene.UpdateDisplay()
  local time = BattleControl.timeSinceLastUpdate
  time = time + Time.deltaTime
  if time > 0.2 then
    UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BATTLE_REMAIN_TIME)
    time = 0
  end
  if BattleScene.IsBattleOver() == false then
    UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_PER_FRAME)
  end
  BattleControl.timeSinceLastUpdate = time
end

function BattleControl.UniqueSkillPause(isPause, unit)
end

function BattleControl.SlowTime(timescale)
  BattleControl.timescaleSlowRatio = timescale
  if BattleControl.isPause == false then
    LoginData.SetTimeScale(BattleControl.timescaleSlowRatio or BattleControl.baseTimeScale)
  end
end

function BattleControl.Pause(isBurstPause, isGuidePause)
  if BattleScene.IsBattleOver() == true then
    return
  end
  if true == BattleControl.isPause then
    return
  end
  BattleControl.isPause = true
  BattleControl.isBurstPause = isBurstPause or false
  BattleControl.isGuidePause = isGuidePause or false
  LoginData.SetTimeScale(0)
end

function BattleControl.Continue()
  if BattleControl.isBurstPause == true then
    BattleControl.UpdateProcess_2(BattleControl.curFixedFrame)
  end
  BattleControl.isPause = false
  BattleControl.isBurstPause = false
  BattleControl.isGuidePause = false
  LoginData.SetTimeScale(BattleControl.timescaleSlowRatio or BattleControl.baseTimeScale)
end

function BattleControl.Stop(isManual, forceClose)
  if BattleControl.isOver == false then
    unitDamageInfoList = {}
    unitRecordList = {}
    local manuallySkillDamageInfoList = {}
    BattleControl.isOver = true
    BattleScene.Stop(isManual or forceClose)
    if true ~= BattleMgr.isBattleServer then
      UpdateManager.RemoveFixedUpdateHandler(BattleControl.UpdateProcess)
      UpdateManager.RemoveUpdateHandler(BattleControl.UpdateDisplay)
      BattleVoice.StopAllVoice()
      if true == BattleMgr.isPlotBattle then
        if PlotBattleScript then
          PlotBattleScript.Close()
        end
        return
      end
      if forceClose then
        return
      end
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and Application.platform ~= RuntimePlatform.WindowsEditor then
        local data = ArenaData.GetChallengeStageRsp()
        BattleMgr.OpenFinishWindow(data)
        return
      end
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        local data = GuildWarData.GetChallengeStageRsp()
        if data and data.battleData.initData.seqId == BattleData.battleUid then
          BattleMgr.OpenFinishWindow(data)
          return
        end
      end
    end
    local teamState1 = {
      cardStates = {}
    }
    local teamState2 = {
      cardStates = {}
    }
    local skillTypeSmall = SKILL_TYPE_ENUM.SMALL
    local skillTypeUnique = SKILL_TYPE_ENUM.UNIQUE
    local skillTypeBurstCard = SKILL_TYPE_ENUM.BURST_CARD
    local stageId = BattleData.stageId
    local statType
    if stageId then
      local stageConfig = TableData.GetConfig(stageId, "BaseStage")
      if stageConfig then
        statType = stageConfig.stat_type
      end
    end
    local allUnit = BattleScene.GetAllUnit()
    local v
    for i = 1, #allUnit do
      v = allUnit[i]
      if v.camp ~= BATTLE_CAMP_FLAG.NEUTRAL then
        if 1 == statType and v.camp == BATTLE_CAMP_FLAG.RIGHT then
          if true ~= v.isBuilding then
            unitDamageInfoList[#unitDamageInfoList + 1] = {
              uid = v.uid,
              camp = v.camp,
              damage = v.damageRecord,
              damaged = v.damagedRecord,
              treat = v.treatRecord,
              treated = v.treatedRecord,
              deadTime = v.deadTime,
              unitInfo = {
                id = v.originId,
                fashionId = v.fashionId,
                quality = v.quality
              },
              killedByUid = v.lastKillSelfUnitUid or v.lastDamageSelfUnitUid or 0
            }
          end
        elseif true ~= v.isBuilding and v.summonId == nil then
          unitDamageInfoList[#unitDamageInfoList + 1] = {
            uid = v.uid,
            camp = v.camp,
            damage = v.damageRecord,
            damaged = v.damagedRecord,
            treat = v.treatRecord,
            treated = v.treatedRecord,
            deadTime = v.deadTime,
            unitInfo = {
              id = v.originId,
              fashionId = v.fashionId,
              quality = v.quality
            },
            killedByUid = v.lastKillSelfUnitUid or v.lastDamageSelfUnitUid or 0
          }
        end
        if v.summonId == nil then
          local object = {}
          object.uid = v.uid
          object.id = v.originId
          object.position = v.positionIndex
          object.hp = v:GetHp()
          object.maxHp = v:GetAttr(ATTR_ENUM.max_hp)
          if v.camp == BATTLE_CAMP_FLAG.LEFT then
            teamState1.cardStates[#teamState1.cardStates + 1] = object
          elseif v.camp == BATTLE_CAMP_FLAG.RIGHT then
            teamState2.cardStates[#teamState2.cardStates + 1] = object
          end
        end
        local savedSkillTrigger = v.savedTriggerSkillList
        local skillInfoList = {}
        local skillTrigger
        for j = 1, #savedSkillTrigger do
          skillTrigger = savedSkillTrigger[j]
          if skillTrigger.type == skillTypeSmall or skillTrigger.type == skillTypeUnique or skillTrigger.type == skillTypeBurstCard then
            local showId = skillTrigger.showId
            if skillTrigger.triggerFromBuff or showId and 0 ~= showId then
              skillInfoList[#skillInfoList + 1] = {
                id = skillTrigger.id,
                type = skillTrigger.type,
                level = skillTrigger.level,
                frame = skillTrigger.frame
              }
            end
          end
        end
        if 1 ~= v.invisibleInAxis then
          unitRecordList[#unitRecordList + 1] = {
            uid = v.uid,
            camp = v.camp,
            deadTime = v.deadTime,
            unitInfo = {
              id = v.id,
              fashionId = v.fashionId,
              quality = v.quality
            },
            skillInfos = skillInfoList
          }
        end
      end
    end
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      local campList = {
        BATTLE_CAMP_FLAG.LEFT,
        BATTLE_CAMP_FLAG.RIGHT
      }
      for i = 1, #campList do
        local skillList = BattleScene.GetManuallySkillByCamp(campList[i])
        if skillList then
          local skill
          for j = 1, #skillList do
            skill = skillList[j]
            manuallySkillDamageInfoList[#manuallySkillDamageInfoList + 1] = {
              skillId = skill.skillId,
              skillLevel = skill.skillLevel,
              camp = skill.camp,
              damage = skill.damageRecord,
              treat = skill.treatRecord,
              shield = skill.shieldRecord,
              activeCount = skill.activeCount,
              skillEffectType = skill.skillEffectType
            }
          end
        end
      end
    end
    if true == BattleMgr.isTestBalance then
      local unit
      for i = 1, #allUnit do
        unit = allUnit[i]
        if unit.camp == BATTLE_CAMP_FLAG.RIGHT then
          BattleControl.leftTotalDamage = BattleControl.leftTotalDamage + unit.totalHurt
        elseif unit.camp == BATTLE_CAMP_FLAG.LEFT then
          local oneSplitDamage = {
            normalOutBurst = 0,
            normalInBurst = 0,
            small = 0,
            unique = 0,
            buff = 0,
            burst = 0,
            summon = 0,
            treatedFromOther = 0,
            treatedRecord = 0
          }
          oneSplitDamage.normalOutBurst = oneSplitDamage.normalOutBurst + unit.normalSkillDamageOutBurst
          oneSplitDamage.normalInBurst = oneSplitDamage.normalInBurst + unit.normalSkillDamageInBurst
          oneSplitDamage.small = oneSplitDamage.small + unit.smallSkillDamage
          oneSplitDamage.unique = oneSplitDamage.unique + unit.uniqueSkillDamage
          oneSplitDamage.burst = oneSplitDamage.burst + unit.burstSkillDamage
          oneSplitDamage.buff = oneSplitDamage.buff + unit.buffDamage
          oneSplitDamage.summon = oneSplitDamage.summon + unit.summonDamage
          oneSplitDamage.treatedFromOther = oneSplitDamage.treatedFromOther + unit.treatedFromOther
          oneSplitDamage.treatedRecord = oneSplitDamage.treatedRecord + unit.treatedRecord
          BattleControl.leftSplitDamage[unit.originId] = oneSplitDamage
        end
      end
    end
    BattleRecord.SaveRecordFile()
    local sendMsg = {}
    local battleData = {}
    local initData = BattleData.savedInitData
    battleData.initData = initData
    battleData.unitDamage = unitDamageInfoList
    battleData.unitRecords = unitRecordList
    battleData.totalFrame = BattleControl.curFixedFrame
    battleData.killMobCount = BattleData.killMobCount
    battleData.manuallySkillDamage = manuallySkillDamageInfoList
    teamState1.uin = initData.actorLeft.uin
    teamState2.uin = initData.actorRight.uin
    battleData.teamState1 = teamState1
    battleData.teamState2 = teamState2
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      battleData.totalTime = math.ceil(BattleData.totalFixedFrames / 30)
      battleData.leftTime = math.ceil((BattleData.totalFixedFrames - BattleControl.curFixedFrame) / 30)
    end
    battleData.skillInfos = BattleScene.GetSkillInfos()
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      battleData.manuallySkillInfos = BattleScene.GetManuallySkillInfos()
    end
    sendMsg.seqId = BattleData.battleUid
    sendMsg.stageId = stageId
    sendMsg.sceneType = BattleData.stageType
    sendMsg.win = BattleScene.IsBattleWin()
    sendMsg.costTime = math.ceil(BattleControl.curFixedFrame / 30)
    sendMsg.battleData = battleData
    sendMsg.abort = false
    if sendMsg.win and BattleData.stageType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      local challengeResultData = {}
      local deadInfoMap = {}
      local embattleInfoMap = {}
      local minHpInfoMap = {}
      challengeResultData.remainTime = math.floor(math.max((BattleData.totalFixedFrames - BattleControl.curFixedFrame) / BATTLE_CONFIG_ENUM.FIXED_FPS, 0))
      local totalMaxHp, totalHp = 0, 0
      for _, unit in ipairs(allUnit) do
        if unit.camp == BATTLE_CAMP_FLAG.LEFT and false == unit.isBuilding and unit.summonId == nil then
          local job = unit.battleUnitType
          if unit:IsDead() or unit:IsDestroy() then
            if nil == deadInfoMap[job] then
              deadInfoMap[job] = 1
            else
              deadInfoMap[job] = deadInfoMap[job] + 1
            end
          end
          if nil == minHpInfoMap[job] then
            minHpInfoMap[job] = math.floor(unit.tempHpPer * 10000)
          else
            minHpInfoMap[job] = math.min(minHpInfoMap[job], math.floor(unit.tempHpPer * 10000))
          end
          if nil == embattleInfoMap[job] then
            embattleInfoMap[job] = 1
          else
            embattleInfoMap[job] = embattleInfoMap[job] + 1
          end
          totalMaxHp = totalMaxHp + unit:GetAttr(ATTR_ENUM.max_hp)
          totalHp = totalHp + unit:GetHp()
        end
      end
      if 0 ~= totalMaxHp then
        challengeResultData.remainHpPercent = math.floor(MathUtil.TruncateFloat(10000 * totalHp / totalMaxHp))
      end
      local formatInfo = function(map)
        local t = {}
        for i, count in pairs(map) do
          table.insert(t, {job = i, value = count})
        end
        return t
      end
      challengeResultData.deadInfos = formatInfo(deadInfoMap)
      challengeResultData.embattleInfos = formatInfo(embattleInfoMap)
      challengeResultData.minHpInfos = formatInfo(minHpInfoMap)
      challengeResultData.remainFrames = BattleData.totalFixedFrames - BattleControl.curFixedFrame
      battleData.challengeResultData = challengeResultData
    elseif BattleData.scoreInfo then
      local challengeResultData = {}
      challengeResultData.score = BattleData.totalDamageScore + BattleData.totalKillScore
      if BattleData.addBuffId and BattleData.addBuffAddCount then
        challengeResultData.buffList = {
          [BattleData.addBuffId] = BattleData.addBuffAddCount
        }
      end
      battleData.challengeResultData = challengeResultData
    end
    if true == IsBattleTest then
      BattleMgr.OpenFinishWindow(sendMsg)
      return
    end
    if true ~= BattleMgr.isBattleServer and BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
      local data = ArenaData.GetChallengeStageRsp()
      local time = os.date("%Y%m%d%H%M%S")
      FileManager.WriteFile("LuaScript/TestRecord/ArenaBattle_" .. time .. "_Client.txt", PrintTable(sendMsg))
      FileManager.WriteFile("LuaScript/TestRecord/ArenaBattle_" .. time .. "_Server.txt", PrintTable(data))
      BattleMgr.OpenFinishWindow(data)
      return
    end
    if true ~= BattleMgr.isBattleServer then
      if true == isManual then
        sendMsg.abort = true
        BattleMgr.SendBattleOverMsg(sendMsg)
      else
        BattleMgr.SendBattleOverMsg(sendMsg)
      end
    else
      if DataFromeGameServer then
        sendMsg.clientVersion = DataFromeGameServer.clientVersion
      end
      MessageSendToGameServer = sendMsg
    end
  end
end
