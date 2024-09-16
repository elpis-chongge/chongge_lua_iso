require("ActivityDungeon1_ChallengeByName")

function GetActivityDungeon1_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
