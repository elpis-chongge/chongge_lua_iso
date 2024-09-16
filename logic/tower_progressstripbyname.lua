require("Tower_ProgressDotByName")

function GetTower_ProgressStripUis(ui)
  local uis = {}
  uis.Dot1 = GetTower_ProgressDotUis(ui:GetChild("Dot1"))
  uis.Dot2 = GetTower_ProgressDotUis(ui:GetChild("Dot2"))
  uis.Dot3 = GetTower_ProgressDotUis(ui:GetChild("Dot3"))
  uis.Dot4 = GetTower_ProgressDotUis(ui:GetChild("Dot4"))
  uis.Dot5 = GetTower_ProgressDotUis(ui:GetChild("Dot5"))
  uis.root = ui
  return uis
end
