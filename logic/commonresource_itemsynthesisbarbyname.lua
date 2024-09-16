require("CommonResource_ItemSynthesisFillByName")

function GetCommonResource_ItemSynthesisBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_ItemSynthesisFillUis(ui:GetChild("bar"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
