require("GuildBoss_GuildBattleRecordByName")

function GetGuildBoss_GuildBattleRecordWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildBattleRecordUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
