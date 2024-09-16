require("CommonResource_AngerFillByName")

function GetCommonResource_AngerBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_AngerFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
