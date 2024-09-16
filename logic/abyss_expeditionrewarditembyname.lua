require("Abyss_ExpeditionRewardFrameByName")

function GetAbyss_ExpeditionRewardItemUis(ui)
  local uis = {}
  uis.StarNumberTxt = ui:GetChild("StarNumberTxt")
  uis.GetTxt = ui:GetChild("GetTxt")
  uis.Item = GetAbyss_ExpeditionRewardFrameUis(ui:GetChild("Item"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
