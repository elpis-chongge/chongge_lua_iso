function GetMessage_ClothesCardBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ClothesNameTxt = ui:GetChild("ClothesNameTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
