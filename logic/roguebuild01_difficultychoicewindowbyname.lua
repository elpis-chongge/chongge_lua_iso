require("RogueBuild01_DifficultyChoiceByName")

function GetRogueBuild01_DifficultyChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_DifficultyChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
