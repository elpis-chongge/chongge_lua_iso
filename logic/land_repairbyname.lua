function GetLand_RepairUis(ui)
  local uis = {}
  
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SurBtn = ui:GetChild("SurBtn")
  uis.root = ui
  return uis
end
