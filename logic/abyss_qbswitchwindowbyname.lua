require("Abyss_QBSwitchByName")

function GetAbyss_QBSwitchWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_QBSwitchUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
