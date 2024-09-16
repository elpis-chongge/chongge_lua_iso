function GetShop_MonthExplain1Uis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
