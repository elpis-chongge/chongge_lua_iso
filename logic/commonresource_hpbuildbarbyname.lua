require("CommonResource_HpBuildFillBackByName")
require("CommonResource_HpBuildFillByName")
require("CommonResource_ScaleStripByName")

function GetCommonResource_HpBuildBarUis(ui)
  local uis = {}
  uis.bar_delay = GetCommonResource_HpBuildFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetCommonResource_HpBuildFillUis(ui:GetChild("bar"))
  uis.ScaleStrip = GetCommonResource_ScaleStripUis(ui:GetChild("ScaleStrip"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.delayCtr = ui:GetController("delay")
  uis.root = ui
  return uis
end
