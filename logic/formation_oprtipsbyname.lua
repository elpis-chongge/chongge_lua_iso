require("Formation_OprTipsMapByName")

function GetFormation_OprTipsUis(ui)
  local uis = {}
  uis.OprTipsMap = GetFormation_OprTipsMapUis(ui:GetChild("OprTipsMap"))
  uis.MapBtn = ui:GetChild("MapBtn")
  uis.root = ui
  return uis
end
