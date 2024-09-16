require("Shop_GetNumberByName")
require("Shop_GiveNumberByName")
require("Shop_DoubleByName")

function GetShop_RechargeTipsBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.GetNumber = GetShop_GetNumberUis(ui:GetChild("GetNumber"))
  uis.GiveNumber = GetShop_GiveNumberUis(ui:GetChild("GiveNumber"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.Double = GetShop_DoubleUis(ui:GetChild("Double"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
