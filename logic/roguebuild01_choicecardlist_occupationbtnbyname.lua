require("RogueBuild01_ChoiceCardList_OccupationBtnBgByName")

function GetRogueBuild01_ChoiceCardList_OccupationBtnUis(ui)
  local uis = {}
  uis.OccupationBtnBg = GetRogueBuild01_ChoiceCardList_OccupationBtnBgUis(ui:GetChild("OccupationBtnBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
