require("RaidBoss_QuickRewardByName")

function GetRaidBoss_QuickRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_QuickRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
