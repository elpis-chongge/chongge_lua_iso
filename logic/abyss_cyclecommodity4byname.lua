require("Abyss_SellOutByName")
require("Abyss_ItemLockByName")
require("Abyss_NewByName")
require("Abyss_CycleCommodityTimeByName")
require("Abyss_CycleCommodity4UseMarkByName")

function GetAbyss_CycleCommodity4Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.SurplusTxt = ui:GetChild("SurplusTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.PriceLoader = ui:GetChild("PriceLoader")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.SellOut = GetAbyss_SellOutUis(ui:GetChild("SellOut"))
  uis.ItemLock = GetAbyss_ItemLockUis(ui:GetChild("ItemLock"))
  uis.New = GetAbyss_NewUis(ui:GetChild("New"))
  uis.Time = GetAbyss_CycleCommodityTimeUis(ui:GetChild("Time"))
  uis.UseMark = GetAbyss_CycleCommodity4UseMarkUis(ui:GetChild("UseMark"))
  uis.SellStateCtr = ui:GetController("SellState")
  uis.TypeCtr = ui:GetController("Type")
  uis.LockCtr = ui:GetController("Lock")
  uis.numberCtr = ui:GetController("number")
  uis.timeCtr = ui:GetController("time")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
