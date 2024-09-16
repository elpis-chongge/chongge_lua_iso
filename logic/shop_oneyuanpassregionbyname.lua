require("Shop_OneYuanPassByName")

function GetShop_OneYuanPassRegionUis(ui)
  local uis = {}
  uis.OneYuanPass = GetShop_OneYuanPassUis(ui:GetChild("OneYuanPass"))
  uis.root = ui
  return uis
end
