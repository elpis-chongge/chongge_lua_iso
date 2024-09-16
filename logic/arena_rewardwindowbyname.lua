require("Arena_RewardByName")

function GetArena_RewardWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_RewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
