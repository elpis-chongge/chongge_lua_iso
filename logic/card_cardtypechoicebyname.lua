function GetCard_CardTypeChoiceUis(ui)
  local uis = {}
  
  uis.GreenBtn = ui:GetChild("GreenBtn")
  uis.TeamBtn = ui:GetChild("TeamBtn")
  uis.ArrayBtn = ui:GetChild("ArrayBtn")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
