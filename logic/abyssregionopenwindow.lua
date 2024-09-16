require("Abyss_ActivityOpenWindowByName")
local AbyssRegionOpenWindow = {}
local uis, contentPane, unlockedRegionId

function AbyssRegionOpenWindow.ReInitData()
end

function AbyssRegionOpenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssRegionOpenWindow.package, WinResConfig.AbyssRegionOpenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    unlockedRegionId = bridgeObj.argTable[1]
    uis = GetAbyss_ActivityOpenWindowUis(contentPane)
    AbyssRegionOpenWindow.UpdateInfo()
    AbyssRegionOpenWindow.InitBtn()
  end)
end

function AbyssRegionOpenWindow.UpdateInfo()
  local config = TableData.GetConfig(unlockedRegionId, "BaseManorMapSub")
  local regionName = config.name()
  uis.Main.Currency1.WordTxt.text = string.format("%s%s", regionName, T(20006))
  uis.Main.Currency1.TimeTxt.text = string.format("%s - ~", TimeUtil.FormatDate("%Y-%m-%d", config.open_time))
end

function AbyssRegionOpenWindow.InitBtn()
  uis.Main.ActivityOpenBg.root.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssRegionOpenWindow.name)
  end)
end

function AbyssRegionOpenWindow.OnClose()
  uis = nil
  contentPane = nil
  if unlockedRegionId then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.REGION_UNLOCK_ACK, unlockedRegionId)
  end
  unlockedRegionId = nil
end

return AbyssRegionOpenWindow
