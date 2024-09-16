require("ActivityDungeon1002_NumberStripByName")
require("ActivityDungeon1002_BuyPriceNumberByName")

function GetActivityDungeon1002_BuyLevelDes1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberStrip = GetActivityDungeon1002_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.BuyPriceNumber = GetActivityDungeon1002_BuyPriceNumberUis(ui:GetChild("BuyPriceNumber"))
  uis.BuyLevelBtn = ui:GetChild("BuyLevelBtn")
  uis.root = ui
  return uis
end
