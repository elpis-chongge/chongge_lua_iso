require("Carnival_RepeatTipsByName")
require("CommonResource_RedDotByName")

function GetCarnival_ActivityBtnUis(ui)
  local uis = {}
  uis.RepeatTips = GetCarnival_RepeatTipsUis(ui:GetChild("RepeatTips"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
