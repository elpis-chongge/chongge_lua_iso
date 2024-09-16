require("Formation_CardBadgeIconByName")
require("Formation_CardBadgeAttributeByName")

function GetFormation_CardBadgeUis(ui)
  local uis = {}
  uis.BadgeIcon = GetFormation_CardBadgeIconUis(ui:GetChild("BadgeIcon"))
  uis.adgeAttribute = GetFormation_CardBadgeAttributeUis(ui:GetChild("adgeAttribute"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
