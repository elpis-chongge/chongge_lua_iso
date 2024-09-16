function GetRogueBuild01_DifficultyPositionTitleUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
