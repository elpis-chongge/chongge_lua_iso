function GetHome_PositionUis(ui)
  local uis = {}
  
  uis.PosTxt = ui:GetChild("PosTxt")
  uis.PosNumberTxt = ui:GetChild("PosNumberTxt")
  uis.ZoomTxt = ui:GetChild("ZoomTxt")
  uis.ZoomSlider = ui:GetChild("ZoomSlider")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.DefaultBtn = ui:GetChild("DefaultBtn")
  uis.KeepBtn = ui:GetChild("KeepBtn")
  uis.root = ui
  return uis
end
