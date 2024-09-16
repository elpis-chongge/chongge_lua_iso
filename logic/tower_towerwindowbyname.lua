require("Tower_TowerByName")

function GetTower_TowerWindowUis(ui)
  local uis = {}
  uis.Main = GetTower_TowerUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
