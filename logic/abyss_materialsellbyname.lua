require("Abyss_SellContainerByName")
require("Abyss_NothingByName")

function GetAbyss_MaterialSellUis(ui)
  local uis = {}
  uis.TabList = ui:GetChild("TabList")
  uis.ItemList = ui:GetChild("ItemList")
  uis.MaterialSell = GetAbyss_SellContainerUis(ui:GetChild("MaterialSell"))
  uis.AllPutBtn = ui:GetChild("AllPutBtn")
  uis.Nothing = GetAbyss_NothingUis(ui:GetChild("Nothing"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
