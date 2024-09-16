function GetExpedition_ReviewTips1Uis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
