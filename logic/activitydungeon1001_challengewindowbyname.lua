require("ActivityDungeon1001_ChallengeByName")

function GetActivityDungeon1001_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
