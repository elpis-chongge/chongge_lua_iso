ActorMgr = {necessaryInfoSuccess = false}

function ActorMgr.EnterHome()
  local callBack = function()
    SettingUtil.UpdateFPS()
    if GuideMgr.jumpNewHand == true or GuideMgr.NeedShowSpecialGuide() == false then
      if false == UIMgr:IsWindowInList(WinResConfig.HomeWindow.name) then
        ld("Home", function()
          UIUtil.ChangeLoginScreenEffectIn(function()
            OpenWindow(WinResConfig.HomeWindow.name, UILayer.MainUI)
          end)
        end)
      elseif true == Net.isReconnectOk then
      end
    else
      local curGuideId = GuideMgr.curTriggerId
      if nil == curGuideId or 0 == curGuideId then
        curGuideId = TableData.GetConfig(70010023, "BaseFixed").int_value
      else
        curGuideId = GuideMgr.curTriggerId
      end
      if false == GuideMgr.curGuideIsPlay then
        local show = GuideMgr.PlayGuideProcess(curGuideId)
        if show then
          UIUtil.ChangeLoginScreenEffectOut()
          return
        end
      end
    end
  end
  ActorMgr.ReqNecessaryInfo(callBack)
end

function ActorMgr.ReqNecessaryInfo(callBack)
  if Net.isReconnectOk == true and true == ActorMgr.necessaryInfoSuccess then
    ActorService.BatchSyncResReq()
    if callBack then
      callBack()
    end
    return
  end
  ActorMgr.loadProgressTable = {}
  ActorMgr.allWeight = 0
  ActorService.GetItemsReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetItemsRsp, 10)
  ActorService.GetAllCardsReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetAllCardsRsp, 10)
  ActorService.GetAllBadgesReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetAllBadgesRsp, 10)
  ActorService.GetCardAllTeamReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetCardAllTeamRsp, 10)
  ActorService.GetStoryListReq(0)
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetStoryListRsp, 10)
  AdventureService.GetSceneInfoReq({
    ProtoEnum.SCENE_TYPE.MAIN_LINE
  })
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetSceneInfoRsp, 10)
  ActorService.GetGuideProgressReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetGuideProgressRsp, 10)
  LoginService.HeartBeatReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.HeartBeatRsp, 10)
  CardService.GetCardClickedStoryEventsReq()
  ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetCardClickedStoryEventsRsp, 10)
  local sendMsg = EnterClampUtil.Init()
  if sendMsg then
    ActorMgr.AddNeedLoadMsg(Proto.MsgName.CheckFeatureOpenRsp, 10)
  end
  ld("PlotPlay", function()
    PlotPlayService.GetAllFinishedPlotsReq()
    ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetAllFinishedPlotsRsp, 10)
  end)
  ld("DailyTask", function()
    DailyTaskData.InitTaskData()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
      DailyTaskService.GetCommonTaskInfoReq()
      ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetCommonTaskInfoRsp, 10)
    end
  end)
  ld("DailySupply", function()
    ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetSupplyInfoRsp, 10)
    DailySupplyService.GetSupplyInfoReq()
  end)
  ld("Sign", function()
    SignService.GetActivityAllReq()
    ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetActivityAllRsp, 10)
  end)
  ld("Story", function()
    StoryService.GetStoryMonsterListReq()
    ActorMgr.AddNeedLoadMsg(Proto.MsgName.GetStoryMonsterListRsp, 10)
  end)
  ld("RaidBoss", function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_RAID, false) then
      RaidBossService.GetRaidBossInfoReq()
    end
  end)
  ld("AbyssExplore")
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE, false) then
    AbyssExploreMgr.GetExploreInfo(function(msg)
      AbyssExploreData.SetManorInfo(msg.manorInfo)
    end)
  else
    AbyssExploreData.SetManorInfo(nil)
  end
  ld("RedDot")
  ld("Mail")
  ld("Guild")
  ld("Shop")
  ld("Arena")
  ld("Badge")
  ld("ActivityDungeon")
  ld("Carnival")
  ld("Biography")
  ActorMgr.ClearCacheData()
  ActorMgr.msgCompleteCallBack = callBack
end

function ActorMgr.AddNeedLoadMsg(name, weight)
  if ActorMgr.loadProgressTable then
    table.insert(ActorMgr.loadProgressTable, {name = name, weight = weight})
    ActorMgr.allWeight = ActorMgr.allWeight + weight
  end
end

function ActorMgr.ClearCacheData()
  ld("Friend", function()
    FriendData.InitFriendData()
  end)
end

function ActorMgr.ShowUin()
  local uiLayer = UIMgr:GetLayerRoot(UILayer.NetCheck)
  if uiLayer then
    local txt = uiLayer:GetChild("IdNumberTxt")
    if txt then
      local uin = ActorData.GetUin()
      if uin then
        txt.text = T(9, Assets.GetFullVersion()) .. "    " .. T(1, uin)
      else
        txt.text = ""
      end
    end
  end
end
