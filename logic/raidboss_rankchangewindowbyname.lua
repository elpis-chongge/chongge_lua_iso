require("RaidBoss_RankChangeByName")

function GetRaidBoss_RankChangeWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_RankChangeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
