require("Abyss_SellOutByName")
require("Abyss_ItemLockByName")
require("CommonResource_RedDotByName")
require("Abyss_NewByName")
require("Abyss_CycleCommodityTimeByName")

function GetAbyss_CycleCommodity1Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.PriceWordTxt = ui:GetChild("PriceWordTxt")
  uis.SurplusTxt = ui:GetChild("SurplusTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.SellOut = GetAbyss_SellOutUis(ui:GetChild("SellOut"))
  uis.ItemLock = GetAbyss_ItemLockUis(ui:GetChild("ItemLock"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.New = GetAbyss_NewUis(ui:GetChild("New"))
  uis.Time = GetAbyss_CycleCommodityTimeUis(ui:GetChild("Time"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.SellStateCtr = ui:GetController("SellState")
  uis.TypeCtr = ui:GetController("Type")
  uis.LockCtr = ui:GetController("Lock")
  uis.numberCtr = ui:GetController("number")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
