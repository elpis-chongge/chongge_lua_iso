function GetRaidBoss_ActionRecordTipsUis(ui)
  local uis = {}
  
  uis.RoundTxt = ui:GetChild("RoundTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.HeadList = ui:GetChild("HeadList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
