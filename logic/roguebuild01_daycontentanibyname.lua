require("RogueBuild01_DayContentByName")

function GetRogueBuild01_DayContentAniUis(ui)
  local uis = {}
  uis.Content = GetRogueBuild01_DayContentUis(ui:GetChild("Content"))
  uis.root = ui
  return uis
end
