require("RogueBuild01_InsideItemLookByName")

function GetRogueBuild01_InsideItemLookWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideItemLookUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
