function GetGuild_Condition1BtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.specialCtr = ui:GetController("special")
  uis.root = ui
  return uis
end
