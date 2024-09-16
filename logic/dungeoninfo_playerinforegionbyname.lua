function GetDungeonInfo_PlayerInfoRegionUis(ui)
  local uis = {}
  
  uis.PlayerLabel1Btn = ui:GetChild("PlayerLabel1Btn")
  uis.PlayerLabel2Btn = ui:GetChild("PlayerLabel2Btn")
  uis.InfoList = ui:GetChild("InfoList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
