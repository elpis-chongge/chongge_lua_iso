require("Formation_CardBadgeAttributeInfo1ByName")

function GetFormation_CardBadgeAttributeUis(ui)
  local uis = {}
  uis.AttributeInfo = GetFormation_CardBadgeAttributeInfo1Uis(ui:GetChild("AttributeInfo"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
