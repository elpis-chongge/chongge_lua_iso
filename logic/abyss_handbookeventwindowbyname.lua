require("Abyss_HandBookEventByName")

function GetAbyss_HandBookEventWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_HandBookEventUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
