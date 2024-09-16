require("GuildBoss_GuildBattleRecordHeadBgByName")

function GetGuildBoss_GuildBattleRecordHeadUis(ui)
  local uis = {}
  uis.Pic = GetGuildBoss_GuildBattleRecordHeadBgUis(ui:GetChild("Pic"))
  uis.root = ui
  return uis
end
