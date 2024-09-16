require("Arena_MapIconBgByName")
require("Arena_OpenStateByName")
require("Arena_LockStateByName")

function GetArena_MapIconUis(ui)
  local uis = {}
  uis.MapIconBg = GetArena_MapIconBgUis(ui:GetChild("MapIconBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.OpenState = GetArena_OpenStateUis(ui:GetChild("OpenState"))
  uis.LockState = GetArena_LockStateUis(ui:GetChild("LockState"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
