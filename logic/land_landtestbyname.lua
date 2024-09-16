function GetLand_LandTestUis(ui)
  local uis = {}
  
  uis.Title1Txt = ui:GetChild("Title1Txt")
  uis.Subtitle1Txt = ui:GetChild("Subtitle1Txt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.PasswordTxt = ui:GetChild("PasswordTxt")
  uis.Title2Txt = ui:GetChild("Title2Txt")
  uis.Subtitle2Txt = ui:GetChild("Subtitle2Txt")
  uis.OtherList = ui:GetChild("OtherList")
  uis.root = ui
  return uis
end
