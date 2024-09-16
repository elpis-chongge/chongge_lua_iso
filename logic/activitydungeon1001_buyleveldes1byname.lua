require("ActivityDungeon1001_NumberStripByName")
require("ActivityDungeon1001_BuyPriceNumberByName")

function GetActivityDungeon1001_BuyLevelDes1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberStrip = GetActivityDungeon1001_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.BuyPriceNumber = GetActivityDungeon1001_BuyPriceNumberUis(ui:GetChild("BuyPriceNumber"))
  uis.BuyLevelBtn = ui:GetChild("BuyLevelBtn")
  uis.root = ui
  return uis
end
