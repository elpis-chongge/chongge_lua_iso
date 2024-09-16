function GetWatch_SetUis(ui)
  local uis = {}
  
  uis.HeadList = ui:GetChild("HeadList")
  uis.SortBtn = ui:GetChild("SortBtn")
  uis.PositionBtn = ui:GetChild("PositionBtn")
  uis.ClothesBtn = ui:GetChild("ClothesBtn")
  uis.root = ui
  return uis
end
