function GetExplore_DispatchTipsUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CardList = ui:GetChild("CardList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.WordTipsTxt = ui:GetChild("WordTipsTxt")
  uis.root = ui
  return uis
end
