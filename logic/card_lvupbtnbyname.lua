require("CommonResource_RedDotByName")

function GetCard_LvUpBtnUis(ui)
  local uis = {}
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
