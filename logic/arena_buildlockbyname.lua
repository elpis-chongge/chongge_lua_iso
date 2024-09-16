require("CommonResource_PopupBgByName")
require("Arena_LockTipsByName")

function GetArena_BuildLockUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BuildLockTips = GetArena_LockTipsUis(ui:GetChild("BuildLockTips"))
  uis.root = ui
  return uis
end
