require("CommonResource_FirmFillByName")

function GetCommonResource_FirmBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_FirmFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
