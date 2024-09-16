require("Abyss_ActivityTabBgByName")
require("CommonResource_RedDotByName")
require("CommonResource_AbyssSign1ByName")
require("CommonResource_AbyssSign4ByName")

function GetAbyss_ActivityTabBtnUis(ui)
  local uis = {}
  uis.ActivityTabBg = GetAbyss_ActivityTabBgUis(ui:GetChild("ActivityTabBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.AbyssSign = GetCommonResource_AbyssSign1Uis(ui:GetChild("AbyssSign"))
  uis.BadgeBoss = GetCommonResource_AbyssSign4Uis(ui:GetChild("BadgeBoss"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.abyssCtr = ui:GetController("abyss")
  uis.badgebossCtr = ui:GetController("badgeboss")
  uis.root = ui
  return uis
end
