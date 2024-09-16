require("Arena_BuildLockByName")

function GetArena_BuildLockWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_BuildLockUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
