require("ActivityDungeon1_MiniStart_EndTipsWindowByName")
local ActivityMiniGameEndTipsWindow = {}
local uis, contentPane, callback

function ActivityMiniGameEndTipsWindow.ReInitData()
end

function ActivityMiniGameEndTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityMiniGameEndTipsWindow.package, WinResConfig.ActivityMiniGameEndTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MiniStart_EndTipsWindowUis(contentPane)
    callback = bridgeObj.argTable[1]
    ActivityMiniGameEndTipsWindow.UpdateInfo()
    ActivityMiniGameEndTipsWindow.InitBtn()
  end)
end

function ActivityMiniGameEndTipsWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_gather_end")
  PlayUITrans(uis.Main.root, "in", function()
    if type(callback) == "function" then
      callback()
    end
    UIMgr:CloseWindow(WinResConfig.ActivityMiniGameEndTipsWindow.name)
  end)
end

function ActivityMiniGameEndTipsWindow.InitBtn()
end

function ActivityMiniGameEndTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityMiniGameEndTipsWindow
