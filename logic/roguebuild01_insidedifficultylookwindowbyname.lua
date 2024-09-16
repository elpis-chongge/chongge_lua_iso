require("RogueBuild01_InsideDifficultyLookByName")

function GetRogueBuild01_InsideDifficultyLookWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideDifficultyLookUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
