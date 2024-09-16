require("Shop_TokenTipsByName")

function GetShop_TokenTipsAniUis(ui)
  local uis = {}
  uis.TokenTips = GetShop_TokenTipsUis(ui:GetChild("TokenTips"))
  uis.root = ui
  return uis
end
