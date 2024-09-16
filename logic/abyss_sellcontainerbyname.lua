require("Abyss_SellTitleByName")
require("Abyss_TotalPriceStripByName")
require("Abyss_NothingByName")

function GetAbyss_SellContainerUis(ui)
  local uis = {}
  uis.SellTitle = GetAbyss_SellTitleUis(ui:GetChild("SellTitle"))
  uis.TotalPriceStrip = GetAbyss_TotalPriceStripUis(ui:GetChild("TotalPriceStrip"))
  uis.SellBtn = ui:GetChild("SellBtn")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.SellItemList = ui:GetChild("SellItemList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Nothing = GetAbyss_NothingUis(ui:GetChild("Nothing"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
