require("Expedition_ReviewTips2_2BgByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetExpedition_ReviewTips2_2Uis(ui)
  local uis = {}
  uis.HeadBg = GetExpedition_ReviewTips2_2BgUis(ui:GetChild("HeadBg"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
