require("RogueBuild01_InsideEndByName")

function GetRogueBuild01_InsideEndWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideEndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
