function GetFormation_SetRoundRegionUis(ui)
  local uis = {}
  
  uis.CardList = ui:GetChild("CardList")
  uis.WordList = ui:GetChild("WordList")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
