require("RogueBuild01_ChoiceCardList_Info2_TitleByName")
require("RogueBuild01_CardUp_Info3AttributeByName")
require("RogueBuild01_CardUp_Info3NoUpByName")
require("RogueBuild01_CardUp_Info3MaxByName")

function GetRogueBuild01_CardUp_Info3Uis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_ChoiceCardList_Info2_TitleUis(ui:GetChild("Title"))
  uis.Attribute1 = GetRogueBuild01_CardUp_Info3AttributeUis(ui:GetChild("Attribute1"))
  uis.Attribute2 = GetRogueBuild01_CardUp_Info3AttributeUis(ui:GetChild("Attribute2"))
  uis.Attribute3 = GetRogueBuild01_CardUp_Info3AttributeUis(ui:GetChild("Attribute3"))
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.NoUpBtn = GetRogueBuild01_CardUp_Info3NoUpUis(ui:GetChild("NoUpBtn"))
  uis.Max = GetRogueBuild01_CardUp_Info3MaxUis(ui:GetChild("Max"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
