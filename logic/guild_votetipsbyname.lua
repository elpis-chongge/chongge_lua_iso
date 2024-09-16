require("CommonResource_RedDotByName")

function GetGuild_VoteTipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.AgreeTxt = ui:GetChild("AgreeTxt")
  uis.DisagreeTxt = ui:GetChild("DisagreeTxt")
  uis.AgreeProgressBar = ui:GetChild("AgreeProgressBar")
  uis.DisagreeProgressBar = ui:GetChild("DisagreeProgressBar")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.root = ui
  return uis
end
