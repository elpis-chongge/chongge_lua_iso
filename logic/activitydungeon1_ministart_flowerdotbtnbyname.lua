require("ActivityDungeon1_MiniStart_GetIntegralByName")

function GetActivityDungeon1_MiniStart_FlowerDotBtnUis(ui)
  local uis = {}
  uis.FlowerLoader = ui:GetChild("FlowerLoader")
  uis.FlowerHolder = ui:GetChild("FlowerHolder")
  uis.GetIntegral = GetActivityDungeon1_MiniStart_GetIntegralUis(ui:GetChild("GetIntegral"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
