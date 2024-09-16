require("BossDungeonWater_BossBattleByName")

function GetBossDungeonWater_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonWater_BossBattleUis(ui:GetChild("Main"))
  uis.stageCtr = ui:GetController("stage")
  uis.root = ui
  return uis
end
