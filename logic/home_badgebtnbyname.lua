require("CommonResource_RedDotByName")

function GetHome_BadgeBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
