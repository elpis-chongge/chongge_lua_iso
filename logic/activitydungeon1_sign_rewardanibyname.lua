require("ActivityDungeon1_Sign_RewardByName")

function GetActivityDungeon1_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
