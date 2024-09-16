require("Abyss_ActivityByName")

function GetAbyss_ActivityWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_ActivityUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
