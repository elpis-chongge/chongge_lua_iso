require("Home_GaChaPicSwitchByName")
require("CommonResource_RedDotByName")
require("CommonResource_LotteryFreeByName")

function GetHome_GaChaBtnUis(ui)
  local uis = {}
  uis.Pic = GetHome_GaChaPicSwitchUis(ui:GetChild("Pic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.LotteryFree = GetCommonResource_LotteryFreeUis(ui:GetChild("LotteryFree"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.LotteryFreeCtr = ui:GetController("LotteryFree")
  uis.root = ui
  return uis
end
