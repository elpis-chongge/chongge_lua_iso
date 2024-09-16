require("Formation_TimeSetStripByName")

function GetFormation_RoundTimeSetUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TimeSetStrip = GetFormation_TimeSetStripUis(ui:GetChild("TimeSetStrip"))
  uis.root = ui
  return uis
end
