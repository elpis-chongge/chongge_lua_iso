require("RaidBoss_RewardShowByName")

function GetRaidBoss_RewardShowWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_RewardShowUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
