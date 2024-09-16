require("RaidBoss_RaidBossByName")

function GetRaidBoss_RaidBossWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_RaidBossUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
