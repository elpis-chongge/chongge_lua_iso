require("CommonResource_PopupBgByName")
require("PlotDungeon_PlotRewardTipsByName")

function GetPlotDungeon_PlotRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PlotRewardTips = GetPlotDungeon_PlotRewardTipsUis(ui:GetChild("PlotRewardTips"))
  uis.root = ui
  return uis
end
