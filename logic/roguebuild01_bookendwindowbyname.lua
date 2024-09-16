require("RogueBuild01_BookEndByName")

function GetRogueBuild01_BookEndWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_BookEndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
