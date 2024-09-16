require("ActivityDungeon1_MiniIntegralWindowByName")
local ActivityMiniGameRecordWindow = {}
local uis, contentPane
local FLOWER_URL_LOOKUP = {
  [1] = "ui://ActivityDungeon1/Flower_1001",
  [2] = "ui://ActivityDungeon1/Flower_1002",
  [3] = "ui://ActivityDungeon1/Flower_1003"
}

function ActivityMiniGameRecordWindow.ReInitData()
end

function ActivityMiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityMiniGameRecordWindow.package, WinResConfig.ActivityMiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MiniIntegralWindowUis(contentPane)
    ActivityMiniGameRecordWindow.UpdateInfo()
    ActivityMiniGameRecordWindow.InitBtn()
  end)
end

function ActivityMiniGameRecordWindow.UpdateInfo()
  local info = Activity1_MiniGameData.GetMiniGameInfo()
  local records = info.records
  local list = uis.Main.TipsList
  table.sort(records, function(x, y)
    return x.stamp > y.stamp
  end)
  
  function list.itemRenderer(i, gcmp)
    local record = records[i + 1]
    local map = record.counts
    local stamp = record.stamp
    local point = record.point
    local child = gcmp:GetChild("Tips")
    local time = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - stamp)
    UIUtil.SetText(child, time, "TimeTxt")
    local rewardTipsTxt = T(20494, point)
    UIUtil.SetText(child, rewardTipsTxt, "WordTxt")
    local itemlist = child:GetChild("ItemList")
    local flowers = {}
    for k, v in pairs(map) do
      table.insert(flowers, {type = k, count = v})
    end
    table.sort(flowers, function(x, y)
      return x.type < y.type
    end)
    
    function itemlist.itemRenderer(j, subgcmp)
      local flower = flowers[j + 1]
      subgcmp:GetChild("FlowerLoader").url = FLOWER_URL_LOOKUP[flower.type]
      UIUtil.SetText(subgcmp, flower.count, "NumberTxt")
    end
    
    itemlist.numItems = #flowers
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function ActivityMiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityMiniGameRecordWindow.name)
  end)
end

function ActivityMiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityMiniGameRecordWindow
