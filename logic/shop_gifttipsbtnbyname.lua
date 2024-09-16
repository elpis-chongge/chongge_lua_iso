require("Shop_GiftTipsBgByName")
require("Shop_GiftWordTipsByName")
require("Shop_MonthTimeByName")
require("Shop_GiftBuyPriceByName")
require("CommonResource_RedDotByName")

function GetShop_GiftTipsBtnUis(ui)
  local uis = {}
  uis.Bg = GetShop_GiftTipsBgUis(ui:GetChild("Bg"))
  uis.Tips = GetShop_GiftWordTipsUis(ui:GetChild("Tips"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.MonthTime = GetShop_MonthTimeUis(ui:GetChild("MonthTime"))
  uis.FreeTxt = ui:GetChild("FreeTxt")
  uis.GiftBuyPrice = GetShop_GiftBuyPriceUis(ui:GetChild("GiftBuyPrice"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c3Ctr = ui:GetController("c3")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
