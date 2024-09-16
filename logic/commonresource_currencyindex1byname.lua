require("CommonResource_Index1ByName")

function GetCommonResource_CurrencyIndex1Uis(ui)
  local uis = {}
  uis.CurrencyIndex1 = GetCommonResource_Index1Uis(ui:GetChild("CurrencyIndex1"))
  uis.root = ui
  return uis
end
