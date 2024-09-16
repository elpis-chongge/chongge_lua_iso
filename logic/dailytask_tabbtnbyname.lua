require("CommonResource_RedDotByName")

function GetDailyTask_TabBtnUis(ui)
  local uis = {}
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
