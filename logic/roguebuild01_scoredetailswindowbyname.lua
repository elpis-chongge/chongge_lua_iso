require("RogueBuild01_ScoreDetailsByName")

function GetRogueBuild01_ScoreDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_ScoreDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
