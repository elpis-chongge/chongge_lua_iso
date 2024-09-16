require("RogueBuild01_DayRewardItemLookByName")

function GetRogueBuild01_DayRewardItemBtnUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ItemLook = GetRogueBuild01_DayRewardItemLookUis(ui:GetChild("ItemLook"))
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
