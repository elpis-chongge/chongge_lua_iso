function GetExpedition_CoverTimeUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Time1Txt = ui:GetChild("Time1Txt")
  uis.Time2Txt = ui:GetChild("Time2Txt")
  uis.EndTipsTxt = ui:GetChild("EndTipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
