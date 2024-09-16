require("CommonResource_CurrencyIndex1ByName")

function GetCommonResource_CurrencyIndex2Uis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CurrencyIndex1 = GetCommonResource_CurrencyIndex1Uis(ui:GetChild("CurrencyIndex1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
