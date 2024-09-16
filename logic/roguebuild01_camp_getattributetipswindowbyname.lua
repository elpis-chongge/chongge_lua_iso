require("RogueBuild01_Camp_GetAttributeTipsByName")

function GetRogueBuild01_Camp_GetAttributeTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_GetAttributeTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
