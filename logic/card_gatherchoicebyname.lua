require("Card_ElementChoiceByName")
require("Card_OccupationChoiceByName")
require("Card_SkillCDChoiceByName")

function GetCard_GatherChoiceUis(ui)
  local uis = {}
  uis.ElementChoice = GetCard_ElementChoiceUis(ui:GetChild("ElementChoice"))
  uis.OccupationChoice = GetCard_OccupationChoiceUis(ui:GetChild("OccupationChoice"))
  uis.SkillCDChoice = GetCard_SkillCDChoiceUis(ui:GetChild("SkillCDChoice"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.AllBtn = ui:GetChild("AllBtn")
  uis.StrengthBtn = ui:GetChild("StrengthBtn")
  uis.RarityBtn = ui:GetChild("RarityBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
