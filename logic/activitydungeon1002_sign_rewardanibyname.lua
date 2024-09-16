require("ActivityDungeon1002_Sign_RewardByName")

function GetActivityDungeon1002_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1002_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
