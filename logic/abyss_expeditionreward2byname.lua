require("CommonResource_PopupBgByName")
require("Abyss_ExpeditionReward1ByName")

function GetAbyss_ExpeditionReward2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ExpeditionReward1 = GetAbyss_ExpeditionReward1Uis(ui:GetChild("ExpeditionReward1"))
  uis.root = ui
  return uis
end
