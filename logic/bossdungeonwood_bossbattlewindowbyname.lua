require("BossDungeonWood_BossBattleByName")

function GetBossDungeonWood_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonWood_BossBattleUis(ui:GetChild("Main"))
  uis.stageCtr = ui:GetController("stage")
  uis.root = ui
  return uis
end
