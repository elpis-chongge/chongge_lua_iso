require("ActivityDungeon1_MiniGameWindowByName")
local ActivityMiniGameMainWindow = {}
local uis, contentPane
ld("Activity1_MiniGame")
local RefreshPanelInfo = function()
  local totalScoreTxt = T(20484)
  local dailyScoreTxt = T(20485)
  local info = Activity1_MiniGameData.GetMiniGameInfo()
  local conf = ActivityDungeonData.GetActivityData()
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = totalScoreTxt
  uis.Main.Top.Integral.NumberTxt.text = info.miniScore
  uis.Main.Top.TodayIntegral.WordTxt.text = dailyScoreTxt
  local threshold = conf.game_day_score
  uis.Main.Top.TodayIntegral.NumberTxt.text = string.format("%s/%s", info.miniDailyScore, threshold)
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 0
  local achieveDailyScoreThresholdTxt = T(20486, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20487), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity1_MiniGameService.MiniGameGetDailyRewardReq()
    end
  end)
end

function ActivityMiniGameMainWindow.ReInitData()
end

function ActivityMiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityMiniGameMainWindow.package, WinResConfig.ActivityMiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MiniGameWindowUis(contentPane)
    ActivityMiniGameMainWindow.UpdateInfo()
    ActivityMiniGameMainWindow.InitBtn()
  end)
end

function ActivityMiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1/MiniGame_1001"
  RedDotMgr.AddNode({
    windowName = WinResConfig.ActivityMiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame1_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.ActivityMiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame1_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity1_MiniGameService.MiniGameInfoReq()
end

function ActivityMiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityMiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ActivityMiniGameWindow.name)
    OpenWindow(WinResConfig.ActivityMiniGameCountdownWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity1_MiniGameData.GetMiniGameInfo()
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(20518))
      return
    end
    OpenWindow(WinResConfig.ActivityMiniGameRecordWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ActivityMiniGameTaskWindow.name)
  end)
end

function ActivityMiniGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.ActivityMiniGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function ActivityMiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity1_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return ActivityMiniGameMainWindow
