require("CommonResource_RedDotByName")

function GetActivityDungeon1001_Passport_TabBtnUis(ui)
  local uis = {}
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
