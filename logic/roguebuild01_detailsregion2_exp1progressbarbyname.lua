require("RogueBuild01_DetailsRegion2_Exp1ProgressFillByName")

function GetRogueBuild01_DetailsRegion2_Exp1ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRogueBuild01_DetailsRegion2_Exp1ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
