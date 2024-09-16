function GetArena_MyRankUis(ui)
  local uis = {}
  
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
