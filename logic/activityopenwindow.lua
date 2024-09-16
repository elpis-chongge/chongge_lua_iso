require("Abyss_ActivityOpenWindowByName")
local ActivityOpenWindow = {}
local uis, contentPane

function ActivityOpenWindow.ReInitData()
end

function ActivityOpenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityOpenWindow.package, WinResConfig.ActivityOpenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_ActivityOpenWindowUis(contentPane)
    ActivityOpenWindow.UpdateInfo()
    ActivityOpenWindow.InitBtn()
  end)
end

function ActivityOpenWindow.UpdateInfo()
end

function ActivityOpenWindow.InitBtn()
end

function ActivityOpenWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityOpenWindow
