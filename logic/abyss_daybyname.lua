function GetAbyss_DayUis(ui)
  local uis = {}
  
  uis.Day1Txt = ui:GetChild("Day1Txt")
  uis.Day2Txt = ui:GetChild("Day2Txt")
  uis.UnitTxt = ui:GetChild("UnitTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
