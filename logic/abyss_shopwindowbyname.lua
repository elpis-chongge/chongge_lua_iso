require("Abyss_ShopByName")

function GetAbyss_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
