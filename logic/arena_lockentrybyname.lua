function GetArena_LockEntryUis(ui)
  local uis = {}
  
  uis.MapLockEntryBtn = ui:GetChild("MapLockEntryBtn")
  uis.BuildLockEntryBtn = ui:GetChild("BuildLockEntryBtn")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
