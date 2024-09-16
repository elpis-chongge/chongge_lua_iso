function GetActorInfo_ConcealUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
