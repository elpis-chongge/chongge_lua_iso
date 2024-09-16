function GetGuild_Condition2BtnUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.InPutTxt = ui:GetChild("InPutTxt")
  uis.specialCtr = ui:GetController("special")
  uis.root = ui
  return uis
end
