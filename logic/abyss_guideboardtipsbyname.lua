function GetAbyss_GuideBoardTipsUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
