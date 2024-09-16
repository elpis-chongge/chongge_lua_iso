function GetCard_Label1Uis(ui)
  local uis = {}
  
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.ClothesBtn = ui:GetChild("ClothesBtn")
  uis.root = ui
  return uis
end
