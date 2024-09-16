require("Badge_RewardItemByName")

function GetBadge_RewardItemReduceUis(ui)
  local uis = {}
  uis.RewardItem = GetBadge_RewardItemUis(ui:GetChild("RewardItem"))
  uis.root = ui
  return uis
end
