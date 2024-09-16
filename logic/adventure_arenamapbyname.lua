require("Adventure_PicMapByName")
require("Adventure_ArenaTimeByName")
require("Adventure_ArenaRankByName")

function GetAdventure_ArenaMapUis(ui)
  local uis = {}
  uis.PicMap = GetAdventure_PicMapUis(ui:GetChild("PicMap"))
  uis.ArenaTime = GetAdventure_ArenaTimeUis(ui:GetChild("ArenaTime"))
  uis.ArenaRank = GetAdventure_ArenaRankUis(ui:GetChild("ArenaRank"))
  uis.ArenaStartBtn = ui:GetChild("ArenaStartBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
