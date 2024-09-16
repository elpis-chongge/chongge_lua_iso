function GetLand_AgreementUis(ui)
  local uis = {}
  
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.AgreeCheckBtn = ui:GetChild("AgreeCheckBtn")
  uis.SurBtn = ui:GetChild("SurBtn")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
