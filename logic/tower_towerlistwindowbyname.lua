require("Tower_TowerListByName")

function GetTower_TowerListWindowUis(ui)
  local uis = {}
  uis.Main = GetTower_TowerListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
