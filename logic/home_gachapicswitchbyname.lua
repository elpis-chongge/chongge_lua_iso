function GetHome_GaChaPicSwitchUis(ui)
  local uis = {}
  
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Pic2Loader = ui:GetChild("Pic2Loader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
