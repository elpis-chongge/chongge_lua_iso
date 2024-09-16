function GetShop_FirstRechargeItemFrameUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
