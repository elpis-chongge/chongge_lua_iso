require("CommonResource_Firm1FillByName")

function GetCommonResource_Firm1BarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Firm1FillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
