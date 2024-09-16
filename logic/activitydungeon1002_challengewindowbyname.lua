require("ActivityDungeon1002_ChallengeByName")

function GetActivityDungeon1002_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
