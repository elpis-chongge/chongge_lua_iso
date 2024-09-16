require("SuperDungeon_RewardItemByName")

function GetSuperDungeon_RewardItemAniUis(ui)
  local uis = {}
  uis.RewardItem = GetSuperDungeon_RewardItemUis(ui:GetChild("RewardItem"))
  uis.root = ui
  return uis
end
