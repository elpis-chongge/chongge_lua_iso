require("Abyss_BatteryProgressFillByName")

function GetAbyss_BatteryProgressBarUis(ui)
  local uis = {}
  uis.bar = GetAbyss_BatteryProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
