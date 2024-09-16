function GetRogueBuild01_BookTabRegionUis(ui)
  local uis = {}
  
  uis.Tab01Btn = ui:GetChild("Tab01Btn")
  uis.Tab02Btn = ui:GetChild("Tab02Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
