require("Passport_ClothesGetTipsByName")

function GetPassport_Clothes_Grade2Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.GetTips = GetPassport_ClothesGetTipsUis(ui:GetChild("GetTips"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.buyCtr = ui:GetController("buy")
  uis.root = ui
  return uis
end
