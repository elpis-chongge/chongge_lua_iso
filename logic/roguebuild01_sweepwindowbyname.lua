require("RogueBuild01_SweepByName")

function GetRogueBuild01_SweepWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_SweepUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
