require("RogueBuild01_ChoiceCardList_Info2_TitleByName")

function GetRogueBuild01_ChoiceCardList_Info3Uis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_ChoiceCardList_Info2_TitleUis(ui:GetChild("Title"))
  uis.SkillList = ui:GetChild("SkillList")
  uis.root = ui
  return uis
end
