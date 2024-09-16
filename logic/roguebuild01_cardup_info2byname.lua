require("RogueBuild01_ChoiceCardList_Info2_TitleByName")

function GetRogueBuild01_CardUp_Info2Uis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_ChoiceCardList_Info2_TitleUis(ui:GetChild("Title"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
