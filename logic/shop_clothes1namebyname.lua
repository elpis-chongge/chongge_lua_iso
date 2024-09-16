function GetShop_Clothes1NameUis(ui)
  local uis = {}
  
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardNameENTxt = ui:GetChild("CardNameENTxt")
  uis.ClothesNameTxt = ui:GetChild("ClothesNameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
