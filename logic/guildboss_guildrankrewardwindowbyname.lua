require("GuildBoss_GuildRankRewardByName")

function GetGuildBoss_GuildRankRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildRankRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
