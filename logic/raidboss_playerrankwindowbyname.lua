require("RaidBoss_PlayerRankByName")

function GetRaidBoss_PlayerRankWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_PlayerRankUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
