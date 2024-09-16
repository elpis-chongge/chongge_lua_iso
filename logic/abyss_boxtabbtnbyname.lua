require("Abyss_BoxTabBgByName")
require("CommonResource_RedDotByName")

function GetAbyss_BoxTabBtnUis(ui)
  local uis = {}
  uis.ActivityTabBg = GetAbyss_BoxTabBgUis(ui:GetChild("ActivityTabBg"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
