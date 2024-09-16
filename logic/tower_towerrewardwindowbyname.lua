require("Tower_TowerRewardByName")

function GetTower_TowerRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetTower_TowerRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
