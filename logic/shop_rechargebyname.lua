function GetShop_RechargeUis(ui)
  local uis = {}
  
  uis.RechargeList = ui:GetChild("RechargeList")
  uis.Jap1Btn = ui:GetChild("Jap1Btn")
  uis.Jap2Btn = ui:GetChild("Jap2Btn")
  uis.root = ui
  return uis
end
