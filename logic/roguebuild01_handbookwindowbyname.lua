require("RogueBuild01_HandBookByName")

function GetRogueBuild01_HandBookWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_HandBookUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
