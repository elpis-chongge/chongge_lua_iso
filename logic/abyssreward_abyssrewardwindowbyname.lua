require("AbyssReward_AbyssRewardByName")

function GetAbyssReward_AbyssRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssReward_AbyssRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
