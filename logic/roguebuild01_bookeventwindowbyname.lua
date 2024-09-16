require("RogueBuild01_BookEventByName")

function GetRogueBuild01_BookEventWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_BookEventUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
