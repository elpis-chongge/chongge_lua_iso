function GetDungeonInfo_RankNumberUis(ui)
  local uis = {}
  
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
