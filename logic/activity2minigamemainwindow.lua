require("ActivityDungeon1001_MiniGameWindowByName")
ld("Activity2_MiniGame")
local Activity2MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local highestScoreTxt = T(20524)
  local info = Activity2_MiniGameData.GetMiniGameInfo()
  local conf = ActivityDungeonData.GetActivityData()
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = highestScoreTxt
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 0
  local achieveDailyScoreThresholdTxt = T(20523, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20487), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity2_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity2MiniGameMainWindow.ReInitData()
end

function Activity2MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2MiniGameMainWindow.package, WinResConfig.Activity2MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_MiniGameWindowUis(contentPane)
    Activity2MiniGameMainWindow.UpdateInfo()
    Activity2MiniGameMainWindow.InitBtn()
  end)
end

function Activity2MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1001/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame2_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame2_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity2_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity2MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity2MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2MiniGameTaskWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity2_MiniGameData.GetMiniGameInfo()
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(20540))
      return
    end
    OpenWindow(WinResConfig.Activity2MiniGameRecordWindow.name)
  end)
end

function Activity2MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity2MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity2_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity2MiniGameMainWindow
