require("CardPreview_CardHeadByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetCardPreview_Info_1Uis(ui)
  local uis = {}
  uis.CardHead = GetCardPreview_CardHeadUis(ui:GetChild("CardHead"))
  uis.StarList = ui:GetChild("StarList")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
