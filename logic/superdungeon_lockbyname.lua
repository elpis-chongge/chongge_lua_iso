require("SuperDungeon_TimeLockByName")
require("SuperDungeon_BuffNumberLockByName")

function GetSuperDungeon_LockUis(ui)
  local uis = {}
  uis.TimeLock = GetSuperDungeon_TimeLockUis(ui:GetChild("TimeLock"))
  uis.BuffNumberLock = GetSuperDungeon_BuffNumberLockUis(ui:GetChild("BuffNumberLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
