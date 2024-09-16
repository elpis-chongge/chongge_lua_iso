require("RogueBuild01_ChoiceCardList_CardBgByName")
require("RogueBuild01_DetailsCardAttributeByName")
require("RogueBuild01_CardUp_CardDieSignByName")

function GetRogueBuild01_CardUp_CardUis(ui)
  local uis = {}
  uis.CardBg = GetRogueBuild01_ChoiceCardList_CardBgUis(ui:GetChild("CardBg"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.Attribute1 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute1"))
  uis.Attribute2 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute2"))
  uis.Attribute3 = GetRogueBuild01_DetailsCardAttributeUis(ui:GetChild("Attribute3"))
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.DieSign = GetRogueBuild01_CardUp_CardDieSignUis(ui:GetChild("DieSign"))
  uis.choiceCtr = ui:GetController("choice")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
