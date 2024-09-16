function GetBadge_SecondaryAttributeTipsUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ContentList = ui:GetChild("ContentList")
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
