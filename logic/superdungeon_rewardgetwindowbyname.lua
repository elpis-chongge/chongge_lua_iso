require("SuperDungeon_RewardGetByName")

function GetSuperDungeon_RewardGetWindowUis(ui)
  local uis = {}
  uis.Main = GetSuperDungeon_RewardGetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
