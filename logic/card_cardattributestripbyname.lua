function GetCard_CardAttributeStripUis(ui)
  local uis = {}
  
  uis.CardAttributeList = ui:GetChild("CardAttributeList")
  uis.root = ui
  return uis
end
