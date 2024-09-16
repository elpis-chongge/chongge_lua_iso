require("RogueBuild01_InsideShopByName")

function GetRogueBuild01_InsideShopWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
