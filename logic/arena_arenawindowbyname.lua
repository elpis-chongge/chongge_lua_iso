require("Arena_ArenaByName")

function GetArena_ArenaWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_ArenaUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
