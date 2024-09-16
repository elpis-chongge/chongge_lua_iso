function GetActorInfo_PasswordModificationUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PasswordList = ui:GetChild("PasswordList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
