function GetGuildBoss_GuildRankInfoGuildUis(ui)
  local uis = {}
  
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.RoundTxt = ui:GetChild("RoundTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
