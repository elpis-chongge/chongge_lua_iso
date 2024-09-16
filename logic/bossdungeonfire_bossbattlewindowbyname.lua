require("BossDungeonFire_BossBattleByName")

function GetBossDungeonFire_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonFire_BossBattleUis(ui:GetChild("Main"))
  uis.stageCtr = ui:GetController("stage")
  uis.root = ui
  return uis
end
