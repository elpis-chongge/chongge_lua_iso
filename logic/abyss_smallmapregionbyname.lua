require("Abyss_SmallMapByName")
require("Abyss_ActionValueByName")
require("Abyss_ActionValueTipsByName")

function GetAbyss_SmallMapRegionUis(ui)
  local uis = {}
  uis.SmallMap = GetAbyss_SmallMapUis(ui:GetChild("SmallMap"))
  uis.ActionValue = GetAbyss_ActionValueUis(ui:GetChild("ActionValue"))
  uis.ActionValueTips = GetAbyss_ActionValueTipsUis(ui:GetChild("ActionValueTips"))
  uis.CloseTipsBtn = ui:GetChild("CloseTipsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
