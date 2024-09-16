require("ActivityDungeon1_BossBattleByName")

function GetActivityDungeon1_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
