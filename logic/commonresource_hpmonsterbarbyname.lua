require("CommonResource_HpMonsterFillBackByName")
require("CommonResource_HpMonsterFillByName")

function GetCommonResource_HpMonsterBarUis(ui)
  local uis = {}
  uis.bar_delay = GetCommonResource_HpMonsterFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetCommonResource_HpMonsterFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.delayCtr = ui:GetController("delay")
  uis.root = ui
  return uis
end
