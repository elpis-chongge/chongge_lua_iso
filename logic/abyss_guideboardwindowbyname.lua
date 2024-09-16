require("Abyss_GuideBoardByName")

function GetAbyss_GuideBoardWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_GuideBoardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
