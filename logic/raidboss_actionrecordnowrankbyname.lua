function GetRaidBoss_ActionRecordNowRankUis(ui)
  local uis = {}
  
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.Rank1Txt = ui:GetChild("Rank1Txt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
