require("Arena_BuildIconBgByName")
require("Arena_OpenStateByName")
require("Arena_LockStateByName")

function GetArena_BuildIconUis(ui)
  local uis = {}
  uis.BuildIconBg = GetArena_BuildIconBgUis(ui:GetChild("BuildIconBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.OpenState = GetArena_OpenStateUis(ui:GetChild("OpenState"))
  uis.LockState = GetArena_LockStateUis(ui:GetChild("LockState"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
