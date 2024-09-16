require("ActivityDungeon1001_MiniIntegralWindowByName")
local Activity2MiniGameRecordWindow = {}
local uis, contentPane

function Activity2MiniGameRecordWindow.ReInitData()
end

function Activity2MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2MiniGameRecordWindow.package, WinResConfig.Activity2MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_MiniIntegralWindowUis(contentPane)
    Activity2MiniGameRecordWindow.UpdateInfo()
    Activity2MiniGameRecordWindow.InitBtn()
  end)
end

function Activity2MiniGameRecordWindow.UpdateInfo()
  local info = Activity2_MiniGameData.GetMiniGameInfo()
  local records = info.records
  local list = uis.Main.TipsList
  table.sort(records, function(x, y)
    return x.stamp > y.stamp
  end)
  
  function list.itemRenderer(i, gcmp)
    local record = records[i + 1]
    local stamp = record.stamp
    local point = record.point
    local child = gcmp:GetChild("Tips")
    local time = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - stamp)
    UIUtil.SetText(child, time, "TimeTxt")
    local rewardTipsTxt = T(20494, point)
    UIUtil.SetText(child, rewardTipsTxt, "WordTxt")
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity2MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity2MiniGameRecordWindow.name)
  end)
end

function Activity2MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity2MiniGameRecordWindow
