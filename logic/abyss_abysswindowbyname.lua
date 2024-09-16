require("Abyss_AbyssByName")

function GetAbyss_AbyssWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_AbyssUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
