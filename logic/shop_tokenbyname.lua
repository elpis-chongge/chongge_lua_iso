require("Shop_LeftTabByName")
require("Shop_TokenListByName")

function GetShop_TokenUis(ui)
  local uis = {}
  uis.LeftTab = GetShop_LeftTabUis(ui:GetChild("LeftTab"))
  uis.TokenItem = GetShop_TokenListUis(ui:GetChild("TokenItem"))
  uis.ExplainBtn = ui:GetChild("ExplainBtn")
  uis.root = ui
  return uis
end
