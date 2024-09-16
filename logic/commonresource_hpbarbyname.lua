require("CommonResource_HpFillBackByName")
require("CommonResource_HpFillByName")

function GetCommonResource_HpBarUis(ui)
  local uis = {}
  uis.bar_delay = GetCommonResource_HpFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetCommonResource_HpFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.delayCtr = ui:GetController("delay")
  uis.root = ui
  return uis
end
