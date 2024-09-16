require("Arena_SeasonTipsWindowByName")
local ArenaSeasonTipsWindow = {}
local uis, contentPane

function ArenaSeasonTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaSeasonTipsWindow.package, WinResConfig.ArenaSeasonTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_SeasonTipsWindowUis(contentPane)
    ArenaSeasonTipsWindow.InitBtn()
    ArenaSeasonTipsWindow.UpdateTextDisplay()
  end)
end

function ArenaSeasonTipsWindow.UpdateTextDisplay()
  uis.Main.SeasonTips1.TitleTxt.text = T(425)
  uis.Main.SeasonTips1.WordTxt.text = T(426)
  local endTime = TimeUtil.FormatDate("%Y/%m/%d", ArenaData.Info.seasonEndTime)
  local startTime = TimeUtil.FormatDate("%Y/%m/%d", ArenaData.Info.seasonStartTime)
  uis.Main.SeasonTips1.TimeTxt.text = T(427, startTime, endTime)
end

function ArenaSeasonTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ArenaSeasonTipsWindow.name)
  end)
end

function ArenaSeasonTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ArenaSeasonTipsWindow
