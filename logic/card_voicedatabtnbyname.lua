require("CommonResource_RedDotByName")

function GetCard_VoiceDataBtnUis(ui)
  local uis = {}
  uis.VoicProgressBar = ui:GetChild("VoicProgressBar")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
