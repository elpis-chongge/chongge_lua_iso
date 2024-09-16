require("Adventure_PicMapByName")
require("Adventure_RaidBossTimeByName")
require("Adventure_RaidBossUnopenByName")

function GetAdventure_RaidBossMapUis(ui)
  local uis = {}
  uis.PicMap = GetAdventure_PicMapUis(ui:GetChild("PicMap"))
  uis.RaidBossTime = GetAdventure_RaidBossTimeUis(ui:GetChild("RaidBossTime"))
  uis.RaidBossUnopen = GetAdventure_RaidBossUnopenUis(ui:GetChild("RaidBossUnopen"))
  uis.RaidBossStartBtn = ui:GetChild("RaidBossStartBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
