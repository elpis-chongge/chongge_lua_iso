function GetRogueBuild01_InsideMapBottomUis(ui)
  local uis = {}
  
  uis.DifficultyBtn = ui:GetChild("DifficultyBtn")
  uis.ItemBtn = ui:GetChild("ItemBtn")
  uis.CardBtn = ui:GetChild("CardBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
