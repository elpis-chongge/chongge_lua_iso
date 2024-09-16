require("RogueBuild01_InsideSacredByName")

function GetRogueBuild01_InsideSacredWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideSacredUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
