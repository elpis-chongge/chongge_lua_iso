require("ShopTips_TokenExplainByName")

function GetShopTips_TokenExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetShopTips_TokenExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
