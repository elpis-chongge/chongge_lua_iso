require("CommonResource_RedDotByName")

function GetAbyss_ShopEnterBtnUis(ui)
  local uis = {}
  uis.TimeHolder = ui:GetChild("TimeHolder")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
