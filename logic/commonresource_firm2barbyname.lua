require("CommonResource_Firm2FillByName")

function GetCommonResource_Firm2BarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Firm2FillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
