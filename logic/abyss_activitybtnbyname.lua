require("CommonResource_AbyssSign2ByName")
require("CommonResource_RedDotByName")

function GetAbyss_ActivityBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.AbyssSign = GetCommonResource_AbyssSign2Uis(ui:GetChild("AbyssSign"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.abyssCtr = ui:GetController("abyss")
  uis.root = ui
  return uis
end
