require("Adventure_PicMapByName")
require("Adventure_TowerProgressByName")

function GetAdventure_TowerMapUis(ui)
  local uis = {}
  uis.PicMap = GetAdventure_PicMapUis(ui:GetChild("PicMap"))
  uis.TowerProgress = GetAdventure_TowerProgressUis(ui:GetChild("TowerProgress"))
  uis.TowerStartBtn = ui:GetChild("TowerStartBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
