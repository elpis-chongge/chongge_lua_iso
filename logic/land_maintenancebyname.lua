function GetLand_MaintenanceUis(ui)
  local uis = {}
  
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SurBtn = ui:GetChild("SurBtn")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
