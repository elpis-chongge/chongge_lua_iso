require("RogueBuild01_ShopBuyByName")

function GetRogueBuild01_ShopBuyWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_ShopBuyUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
