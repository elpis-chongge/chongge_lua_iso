function GetBadge_BadgeScreen1Uis(ui)
  local uis = {}
  
  uis.ScreenList = ui:GetChild("ScreenList")
  uis.ResettingBtn = ui:GetChild("ResettingBtn")
  uis.ScreenSureBtn = ui:GetChild("ScreenSureBtn")
  uis.root = ui
  return uis
end
