require("ActivityDungeon1002_BossBattleByName")

function GetActivityDungeon1002_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
