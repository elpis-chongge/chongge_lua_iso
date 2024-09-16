require("CommonResource_HpBossFillBackByName")
require("CommonResource_HpBossFillByName")

function GetCommonResource_HpBossBarUis(ui)
  local uis = {}
  uis.bar_delay = GetCommonResource_HpBossFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetCommonResource_HpBossFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.delayCtr = ui:GetController("delay")
  uis.root = ui
  return uis
end
