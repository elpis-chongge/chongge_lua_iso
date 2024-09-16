require("ActivityDungeon1001_Sign_RewardByName")

function GetActivityDungeon1001_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1001_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
