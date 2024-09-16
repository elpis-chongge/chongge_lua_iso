require("ActivityDungeon1_NumberStripByName")
require("ActivityDungeon1_BuyPriceNumberByName")

function GetActivityDungeon1_BuyLevelDes1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberStrip = GetActivityDungeon1_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.BuyPriceNumber = GetActivityDungeon1_BuyPriceNumberUis(ui:GetChild("BuyPriceNumber"))
  uis.BuyLevelBtn = ui:GetChild("BuyLevelBtn")
  uis.root = ui
  return uis
end
