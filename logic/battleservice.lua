BattleService = {}

function BattleService.Init()
  Net.AddListener(Proto.MsgName.PrepareBattleRsp, BattleService.DealPrepareBattleRsp)
  Net.AddListener(Proto.MsgName.SaveStagePrepareInfoRsp, BattleService.DealSaveStagePrepareInfoRsp)
  Net.AddListener(Proto.MsgName.ChallengeStageRsp, BattleService.DealChallengeStageRsp)
  Net.AddListener(Proto.MsgName.GetBattleRecordRsp, BattleService.GetBattleRecordRsp)
end

function BattleService.SaveStagePrepareInfoReq(sceneType, cardUid2Pos, buildUid2Pos, leaderCardId, burstOrderSetting, callback)
  local msg = {}
  msg.prepareStoreSceneType = FormationMgr.GetPrepareSceneType(sceneType)
  msg.cardUid2Pos = cardUid2Pos
  msg.buildUid2Pos = buildUid2Pos
  msg.leaderCardId = leaderCardId
  msg.burstOrderSetting = burstOrderSetting
  Net.Send(Proto.MsgName.SaveStagePrepareInfoReq, msg, callback)
end

function BattleService.DealSaveStagePrepareInfoRsp(msg)
end

function BattleService.PrepareBattleReq(params)
  BattleData.ClearCachedChallengeStageRsp()
  params.prepareStoreSceneType = FormationMgr.GetPrepareSceneType(params.sceneType)
  if params.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    Net.Send(Proto.MsgName.PrepareBattleReq, params, nil, function(retCode)
      if retCode == ProtoEnum.RET_CODE.RC_ARENA_OPPONENT_CHANGE then
        MessageBox.Show(T(10874), {
          touchCallback = function()
            params.arenaForceRank = true
            BattleService.PrepareBattleReq(params)
          end
        }, {
          touchCallback = function()
            UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
          end
        })
      elseif retCode == ProtoEnum.RET_CODE.RC_ARENA_TARGET_CANT_FIGHT then
        MessageBox.Show(T(10875), {
          touchCallback = function()
            ArenaService.ArenaGetAllReq(function()
              UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
            end)
          end
        })
      end
    end)
  else
    Net.Send(Proto.MsgName.PrepareBattleReq, params)
  end
end

function BattleService.DealPrepareBattleRsp(msg)
  local initData = msg.initData
  if initData.sceneType == ProtoEnum.SCENE_TYPE.ARENA or initData.quickBattle == true then
    local sendMsg = {}
    local battleData = {}
    battleData.initData = initData
    sendMsg.seqId = initData.seqId
    sendMsg.stageId = initData.stageId
    sendMsg.sceneType = initData.sceneType
    sendMsg.win = false
    sendMsg.battleData = battleData
    BattleService.ChallengeStageReq(sendMsg)
    if initData.sceneType == ProtoEnum.SCENE_TYPE.MANOR or initData.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.BATTLE_START, msg)
    end
  else
    local stageId = initData.stageId
    local stageConfig = TableData.GetConfig(stageId, "BaseStage")
    if stageConfig and stageConfig.op_story_id then
      ld("PlotPlay", function()
        if PlotPlayData.GetCurPartId() == stageConfig.op_story_id then
          return
        end
        PlotPlayMgr.PlayPlot(stageConfig.op_story_id, nil, nil, function()
          BattleMgr.InitBattle(msg)
        end, nil, nil, PLOT_PLAY_TYPE.MAIN_LINE)
      end)
    else
      if BattleData.initData and BattleData.initData.seqId == msg.initData.seqId then
        return
      end
      BattleMgr.InitBattle(msg)
    end
    if initData.sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_BADGE_EXP or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_COIN or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_ROLE_EXP or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_SKILL_BOOK or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_QUALITY_UP or initData.sceneType == ProtoEnum.SCENE_TYPE.DAILY_MATERIAL then
      AdventureMgr.SaveDailyStageNew(initData.sceneType, stageId)
    end
    if initData.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_BOSS then
      AdventureData.SaveDailyStageNew(stageId, true)
    end
    if initData.sceneType == ProtoEnum.SCENE_TYPE.MANOR or initData.sceneType == ProtoEnum.SCENE_TYPE.MANOR_FIR or initData.sceneType == ProtoEnum.SCENE_TYPE.MANOR_WATER or initData.sceneType == ProtoEnum.SCENE_TYPE.MANOR_WOOD or initData.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE or initData.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.BATTLE_START, msg)
    end
  end
end

function BattleService.ChallengeStageReq(reqMsg, rspCallback, errorCallback)
  BattleData.tempLevel = ActorData.GetLevel()
  BattleData.tempExp = ActorData.GetExp()
  BattleData.tempAbort = reqMsg.abort
  reqMsg.clientVersion = Assets.GetFullVersion()
  Net.Send(Proto.MsgName.ChallengeStageReq, reqMsg, rspCallback, errorCallback)
end

function BattleService.DealChallengeStageRsp(msg)
  local stageData = TableData.GetConfig(msg.stageId, "BaseStage")
  if msg.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    ArenaData.SaveChallengeStageRsp(msg)
    BattleMgr.InitBattle(msg.battleData)
  elseif stageData and stageData.type == ProtoEnum.STAGE_TYPE.PLOT and (msg.sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE or msg.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML) then
    local Next = function()
      if ActorData.GetLevel() > BattleData.tempLevel then
        local CheckChapterChange = function()
          local sceneInfo = AdventureData.GetSceneData(msg.sceneType)
          if msg.win and msg.sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE and stageData.next == nil then
            AdventureMgr.SaveChangeChapterId(stageData.chapter_id)
          end
        end
        AdventureService.GetSceneInfoReq({
          msg.sceneType
        }, function()
          OpenWindow(WinResConfig.LevelUpWindow.name, nil, nil, BattleData.tempLevel)
          CheckChapterChange()
          AdventureMgr.UpdateChallengeStageData(msg)
        end)
      else
        AdventureMgr.UpdateChallengeStageData(msg)
      end
    end
    if msg.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML then
      ActivityDungeonService.GetActivityAllReq()
    end
    local drops = {}
    for i, v in ipairs(msg.FirstItemDrops) do
      table.insert(drops, v)
    end
    for i, v in ipairs(msg.itemDrops) do
      table.insert(drops, v)
    end
    if stageData.settlement_no_show == nil and #drops > 0 then
      GetItemTips.Show(drops, true, Next)
    else
      Next()
    end
  else
    local callback = function()
      if msg.sceneType == ProtoEnum.SCENE_TYPE.MANOR or msg.sceneType == ProtoEnum.SCENE_TYPE.MANOR_FIR or msg.sceneType == ProtoEnum.SCENE_TYPE.MANOR_WATER or msg.sceneType == ProtoEnum.SCENE_TYPE.MANOR_WOOD then
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.BATTLE_COMPLETE, msg)
      elseif msg.sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
        if RaidBossMgr then
          RaidBossMgr.OnBattleComplete(msg)
        end
      elseif msg.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
        if msg.nextInitData then
          BattleData.CacheChallengeStageRsp(msg)
          UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_CHANGE_WAVE)
          BattleShow:ChangeBattleWave("Assets/Art/Effects/Prefab/battle/FX_ChangeWaveInBattle.prefab", function()
            if UIMgr:IsWindowOpen(WinResConfig.BattleUIWindow.name) then
              BattleMgr.CloseBattle(nil, nil, {notReopen = true, force = true})
            end
            BattleMgr.InitBattle({
              initData = msg.nextInitData
            })
          end)
          return
        else
          ExpeditionMgr.OnBattleComplete(msg)
        end
      elseif msg.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
        FrostDungeonMgr.OnBattleComplete(msg)
      elseif msg.sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        RogueService.GetRogueInfoReq()
        local extData = msg.extData
        if extData then
          local result = Net.DecodePb("RogueNodeBattleResult", extData)
          RogueGameMgr.OnBattleComplete(result)
          if result.gameSettle then
            BattleMgr.CloseBattle()
            return
          end
        end
      elseif msg.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        GuildWarMgr.OnBattleComplete()
      else
        AdventureMgr.UpdateChallengeStageData(msg)
      end
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_FINISH_WINDOW, false) then
        BattleMgr.OpenFinishWindow(msg)
      else
        BattleMgr.CloseBattle()
        BattleData.Clear()
      end
    end
    if msg.win and stageData.ed_story_id then
      ld("PlotPlay", function()
        LoginData.SetTimeScale(1)
        PlotPlayMgr.PlayPlot(stageData.ed_story_id, nil, nil, callback, nil, nil, PLOT_PLAY_TYPE.MAIN_LINE)
      end)
    else
      callback()
    end
  end
end

function BattleService.GetBattleRecordReq(battleUid, callback)
  local m = {}
  m.battleUid = battleUid
  Net.Send(Proto.MsgName.GetBattleRecordReq, m, callback)
end

function BattleService.GetBattleRecordRsp(msg)
end

BattleService.Init()
