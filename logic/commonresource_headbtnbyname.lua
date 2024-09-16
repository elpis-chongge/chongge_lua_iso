require("CommonResource_CardTypeByName")

function GetCommonResource_HeadBtnUis(ui)
  local uis = {}
  uis.PlayerHead = GetCommonResource_CardTypeUis(ui:GetChild("PlayerHead"))
  uis.MonsterLoader = ui:GetChild("MonsterLoader")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.c5Ctr = ui:GetController("c5")
  uis.root = ui
  return uis
end
