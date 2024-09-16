require("RogueBuild01_InsidePlotEndByName")

function GetRogueBuild01_InsidePlotEndWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsidePlotEndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
