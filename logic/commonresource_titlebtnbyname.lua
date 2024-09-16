function GetCommonResource_TitleBtnUis(ui)
  local uis = {}
  
  uis.TitleImage = ui:GetChild("TitleImage")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
