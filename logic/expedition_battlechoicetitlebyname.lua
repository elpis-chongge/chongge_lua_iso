function GetExpedition_BattleChoiceTitleUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.BuffBtn = ui:GetChild("BuffBtn")
  uis.root = ui
  return uis
end
