require("RogueBuild01_DetailsCardBgByName")
require("RogueBuild01_DetailsCardAttributeByName")

function GetRogueBuild01_DetailsCardUis(ui)
  local uis = {}
  uis.CardBg = GetRogueBuild01_DetailsCardBgUis(ui:GetChild("CardBg"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.Attribute1 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute1"))
  uis.Attribute2 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute2"))
  uis.Attribute3 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
