function GetGuildBoss_GuildRankTipsUis(ui)
  local uis = {}
  
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.CardNumberTxt = ui:GetChild("CardNumberTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.RoundTxt = ui:GetChild("RoundTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
