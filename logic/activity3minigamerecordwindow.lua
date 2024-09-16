require("ActivityDungeon1002_MiniIntegralWindowByName")
local Activity3MiniGameRecordWindow = {}
local uis, contentPane

function Activity3MiniGameRecordWindow.ReInitData()
end

function Activity3MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3MiniGameRecordWindow.package, WinResConfig.Activity3MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_MiniIntegralWindowUis(contentPane)
    Activity3MiniGameRecordWindow.UpdateInfo()
    Activity3MiniGameRecordWindow.InitBtn()
  end)
end

function Activity3MiniGameRecordWindow.UpdateInfo()
  local info = Activity3_MiniGameData.GetMiniGameInfo()
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
    UIUtil.SetText(child, T(1658), "WordTxt")
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity3MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity3MiniGameRecordWindow.name)
  end)
end

function Activity3MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity3MiniGameRecordWindow
