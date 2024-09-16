require("Shop_FirstRechargeByName")

function GetShop_FirstRechargeRegionUis(ui)
  local uis = {}
  uis.FirstRecharge = GetShop_FirstRechargeUis(ui:GetChild("FirstRecharge"))
  uis.root = ui
  return uis
end
