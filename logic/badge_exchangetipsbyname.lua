require("Badge_ExchangeCardSuitByName")
require("Badge_ExchangeChoiceRegionByName")

function GetBadge_ExchangeTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Card1 = GetBadge_ExchangeCardSuitUis(ui:GetChild("Card1"))
  uis.Card2 = GetBadge_ExchangeCardSuitUis(ui:GetChild("Card2"))
  uis.ChoiceRegion = GetBadge_ExchangeChoiceRegionUis(ui:GetChild("ChoiceRegion"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
