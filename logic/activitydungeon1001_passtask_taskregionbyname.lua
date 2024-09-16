require("ActivityDungeon1001_TaskMaxByName")

function GetActivityDungeon1001_PassTask_TaskRegionUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.Max = GetActivityDungeon1001_TaskMaxUis(ui:GetChild("Max"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
