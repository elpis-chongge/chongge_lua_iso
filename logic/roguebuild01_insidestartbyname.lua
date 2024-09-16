require("RogueBuild01_InsideStart_AniByName")

function GetRogueBuild01_InsideStartUis(ui)
  local uis = {}
  uis.Ani = GetRogueBuild01_InsideStart_AniUis(ui:GetChild("Ani"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
