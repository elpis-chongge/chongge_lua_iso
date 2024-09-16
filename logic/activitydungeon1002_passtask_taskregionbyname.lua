require("ActivityDungeon1002_TaskMaxByName")

function GetActivityDungeon1002_PassTask_TaskRegionUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.Max = GetActivityDungeon1002_TaskMaxUis(ui:GetChild("Max"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
