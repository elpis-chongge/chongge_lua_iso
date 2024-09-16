function GetGuildBoss_GuildRankRewardInfoUis(ui)
  local uis = {}
  
  uis.RankWordTxt = ui:GetChild("RankWordTxt")
  uis.RankNumberTxt = ui:GetChild("RankNumberTxt")
  uis.TimeWordTxt = ui:GetChild("TimeWordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.root = ui
  return uis
end
