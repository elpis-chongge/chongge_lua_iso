require("ActivityDungeon1001_BossBattleByName")

function GetActivityDungeon1001_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
