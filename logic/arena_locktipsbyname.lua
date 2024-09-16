require("Arena_BuildLockTipsByName")
require("Arena_MapLockTipsByName")

function GetArena_LockTipsUis(ui)
  local uis = {}
  uis.BuildLockTips = GetArena_BuildLockTipsUis(ui:GetChild("BuildLockTips"))
  uis.MapLockTips = GetArena_MapLockTipsUis(ui:GetChild("MapLockTips"))
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
