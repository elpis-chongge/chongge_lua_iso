require("RogueBuild01_ChoiceCardList_CardBgByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetRogueBuild01_ChoiceCardList_CardUis(ui)
  local uis = {}
  uis.CardBg = GetRogueBuild01_ChoiceCardList_CardBgUis(ui:GetChild("CardBg"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.c1Ctr = ui:GetController("c1")
  uis.choiceCtr = ui:GetController("choice")
  uis.root = ui
  return uis
end
