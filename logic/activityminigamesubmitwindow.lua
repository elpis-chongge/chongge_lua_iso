require("ActivityDungeon1_MiniStart_EndRewardWindowByName")
local ActivityMiniGameSubmitWindow = {}
local uis, contentPane, submitlist

function ActivityMiniGameSubmitWindow.ReInitData()
end

function ActivityMiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityMiniGameSubmitWindow.package, WinResConfig.ActivityMiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MiniStart_EndRewardWindowUis(contentPane)
    submitlist = bridgeObj.argTable[1]
    ActivityMiniGameSubmitWindow.UpdateInfo()
    ActivityMiniGameSubmitWindow.InitBtn()
  end)
end

local FLOWER_URL_LOOKUP = {
  [1] = "ui://ActivityDungeon1/Flower_1001",
  [2] = "ui://ActivityDungeon1/Flower_1002",
  [3] = "ui://ActivityDungeon1/Flower_1003"
}

function ActivityMiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20491)
  local titleTxt = T(20492)
  uis.Main.TitleTxt.text = titleTxt
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  local itemlist = uis.Main.ItemList
  
  function itemlist.itemRenderer(i, gcmp)
    local item = submitlist[i + 1]
    local count = item.count
    gcmp:GetChild("FlowerLoader").url = FLOWER_URL_LOOKUP[item.type]
    UIUtil.SetText(gcmp, count, "NumberTxt")
  end
  
  itemlist.numItems = submitlist and #submitlist or 0
end

function ActivityMiniGameSubmitWindow.InitBtn()
  local submitCallback
  if submitlist then
    local map = {}
    for _, v in ipairs(submitlist) do
      map[v.type] = v.count
    end
    local conf = ActivityDungeonData.GetActivityData()
    local point = 0
    for i, v in pairs(map) do
      if i <= #conf.game_config then
        point = point + tonumber(conf.game_config[i]) * v
      end
    end
    
    function submitCallback()
      local seconds = 180
      Activity1_MiniGameService.MiniGameSubmitReq(map, point, seconds)
    end
    
    uis.Main.NumberTxt.text = T(20494, point)
  end
  uis.Main.AgainBtn.onClick:Set(function()
    if submitCallback then
      submitCallback()
    end
    UIMgr:SendWindowMessage(WinResConfig.ActivityMiniGameWindow.name, WindowMsgEnum.Activity1_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.ActivityMiniGameSubmitWindow.name)
    OpenWindow(WinResConfig.ActivityMiniGameCountdownWindow.name)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    if submitCallback then
      submitCallback()
    end
    UIMgr:CloseToWindow(WinResConfig.ActivityMiniGameMainWindow.name)
  end)
end

function ActivityMiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  submitlist = nil
end

return ActivityMiniGameSubmitWindow
