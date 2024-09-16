require("Passport_NumberStripByName")
require("Passport_BuyPriceNumberByName")

function GetPassport_BuyLevelDes1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberStrip = GetPassport_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.BuyPriceNumber = GetPassport_BuyPriceNumberUis(ui:GetChild("BuyPriceNumber"))
  uis.BuyLevelBtn = ui:GetChild("BuyLevelBtn")
  uis.root = ui
  return uis
end
