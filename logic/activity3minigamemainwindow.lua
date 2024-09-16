require("ActivityDungeon1002_MiniGameWindowByName")
ld("Activity3_MiniGame")
local Activity3MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local info = Activity3_MiniGameData.GetMiniGameInfo()
  local conf = ActivityDungeonData.GetActivityData()
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(1657)
  uis.Main.Top.Integral.NumberTxt.text = info.miniScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 0
  local achieveDailyScoreThresholdTxt = T(1664, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20487), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity3_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity3MiniGameMainWindow.ReInitData()
end

function Activity3MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3MiniGameMainWindow.package, WinResConfig.Activity3MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_MiniGameWindowUis(contentPane)
    Activity3MiniGameMainWindow.UpdateInfo()
    Activity3MiniGameMainWindow.InitBtn()
  end)
end

function Activity3MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1002/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame3_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame3_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity3_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity3MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity3MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3MiniGameTaskWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity3_MiniGameData.GetMiniGameInfo()
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(1665))
      return
    end
    OpenWindow(WinResConfig.Activity3MiniGameRecordWindow.name)
  end)
end

function Activity3MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity3MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity3_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity3MiniGameMainWindow
