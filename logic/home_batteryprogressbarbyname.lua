require("Home_BatteryProgressFillByName")

function GetHome_BatteryProgressBarUis(ui)
  local uis = {}
  uis.bar = GetHome_BatteryProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
