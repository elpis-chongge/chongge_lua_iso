require("RogueBuild01_InsidePlotEventByName")

function GetRogueBuild01_InsidePlotEventWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsidePlotEventUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
