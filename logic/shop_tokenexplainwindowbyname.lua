require("Shop_TokenExplainByName")

function GetShop_TokenExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_TokenExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
