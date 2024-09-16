require("GuildTrain_RankPlayerByName")

function GetGuildTrain_RankPlayerAniUis(ui)
  local uis = {}
  uis.RankPlayer = GetGuildTrain_RankPlayerUis(ui:GetChild("RankPlayer"))
  uis.root = ui
  return uis
end
