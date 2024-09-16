function GetShop_ClothesTips1BtnUis(ui)
  local uis = {}
  
  uis.ClothesShowLoader = ui:GetChild("ClothesShowLoader")
  uis.ClothesShowHolder = ui:GetChild("ClothesShowHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c4Ctr = ui:GetController("c4")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
