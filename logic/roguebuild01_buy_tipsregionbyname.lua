require("RogueBuild01_Buy_TipsByName")
require("RogueBuild01_BuySacred_TipsByName")

function GetRogueBuild01_Buy_TipsRegionUis(ui)
  local uis = {}
  uis.BuyTips = GetRogueBuild01_Buy_TipsUis(ui:GetChild("BuyTips"))
  uis.SacredTips = GetRogueBuild01_BuySacred_TipsUis(ui:GetChild("SacredTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
