require("RogueBuild01_StartChoiceCardListByName")

function GetRogueBuild01_StartChoiceCardListWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_StartChoiceCardListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
