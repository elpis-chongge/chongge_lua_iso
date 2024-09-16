require("ActivityDungeon1_TaskMaxByName")

function GetActivityDungeon1_PassTask_TaskRegionUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.Max = GetActivityDungeon1_TaskMaxUis(ui:GetChild("Max"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
