require("BossDungeonWater_BossMainByName")

function GetBossDungeonWater_BossDungeonUis(ui)
  local uis = {}
  uis.BossMain = GetBossDungeonWater_BossMainUis(ui:GetChild("BossMain"))
  uis.root = ui
  return uis
end
