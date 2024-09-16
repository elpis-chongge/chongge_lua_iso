require("Badge_ExchangeCardSuitBgByName")
require("Badge_ExchangeIconByName")

function GetBadge_ExchangeCardSuitUis(ui)
  local uis = {}
  uis.CardBg = GetBadge_ExchangeCardSuitBgUis(ui:GetChild("CardBg"))
  uis.Icon1 = GetBadge_ExchangeIconUis(ui:GetChild("Icon1"))
  uis.Icon2 = GetBadge_ExchangeIconUis(ui:GetChild("Icon2"))
  uis.Icon3 = GetBadge_ExchangeIconUis(ui:GetChild("Icon3"))
  uis.root = ui
  return uis
end
