function GetGuild_Vote1Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.AgreeTxt = ui:GetChild("AgreeTxt")
  uis.DisagreeTxt = ui:GetChild("DisagreeTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.AgreeProgressBar = ui:GetChild("AgreeProgressBar")
  uis.DisagreeProgressBar = ui:GetChild("DisagreeProgressBar")
  uis.AgreeNumberTxt = ui:GetChild("AgreeNumberTxt")
  uis.DisagreeNumberTxt = ui:GetChild("DisagreeNumberTxt")
  uis.AgreeBtn = ui:GetChild("AgreeBtn")
  uis.DisagreeBtn = ui:GetChild("DisagreeBtn")
  uis.root = ui
  return uis
end
