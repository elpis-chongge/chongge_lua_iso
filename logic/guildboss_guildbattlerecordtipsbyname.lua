require("GuildBoss_GuildBattleRecordHeadByName")

function GetGuildBoss_GuildBattleRecordTipsUis(ui)
  local uis = {}
  uis.Head = GetGuildBoss_GuildBattleRecordHeadUis(ui:GetChild("Head"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.RoundTxt = ui:GetChild("RoundTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.TimeAxisBtn = ui:GetChild("TimeAxisBtn")
  uis.DataBtn = ui:GetChild("DataBtn")
  uis.PlayBackBtn = ui:GetChild("PlayBackBtn")
  uis.root = ui
  return uis
end
