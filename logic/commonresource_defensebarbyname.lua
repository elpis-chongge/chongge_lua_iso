require("CommonResource_DefenseFillBackByName")
require("CommonResource_DefenseFillByName")

function GetCommonResource_DefenseBarUis(ui)
  local uis = {}
  uis.bar_delay1 = GetCommonResource_DefenseFillBackUis(ui:GetChild("bar_delay1"))
  uis.bar = GetCommonResource_DefenseFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
