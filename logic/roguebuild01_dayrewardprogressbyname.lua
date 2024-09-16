function GetRogueBuild01_DayRewardProgressUis(ui)
  local uis = {}
  
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
