require("Shop_OneYuanPassTipsByName")

function GetShop_OneYuanPassTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_OneYuanPassTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
