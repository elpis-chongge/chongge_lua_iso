require("Formation_CardBageSuitByName")

function GetFormation_CardBadgeRegionUis(ui)
  local uis = {}
  uis.BadgeList = ui:GetChild("BadgeList")
  uis.Suit = GetFormation_CardBageSuitUis(ui:GetChild("Suit"))
  uis.root = ui
  return uis
end
