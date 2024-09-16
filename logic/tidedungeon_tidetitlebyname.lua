function GetTideDungeon_TideTitleUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
