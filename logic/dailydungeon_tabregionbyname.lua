function GetDailyDungeon_TabRegionUis(ui)
  local uis = {}
  
  uis.Tab10Btn = ui:GetChild("Tab10Btn")
  uis.Tab11Btn = ui:GetChild("Tab11Btn")
  uis.Tab12Btn = ui:GetChild("Tab12Btn")
  uis.Tab13Btn = ui:GetChild("Tab13Btn")
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.Tab4Btn = ui:GetChild("Tab4Btn")
  uis.Tab5Btn = ui:GetChild("Tab5Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
