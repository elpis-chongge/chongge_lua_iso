require("CommonResource_HpEliteFillBackByName")
require("CommonResource_HpEliteFillByName")

function GetCommonResource_HpEliteBarUis(ui)
  local uis = {}
  uis.bar_delay = GetCommonResource_HpEliteFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetCommonResource_HpEliteFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.delayCtr = ui:GetController("delay")
  uis.root = ui
  return uis
end
