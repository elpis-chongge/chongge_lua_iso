require("BossDungeonWood_BossMainByName")

function GetBossDungeonWood_BossDungeonUis(ui)
  local uis = {}
  uis.BossMain = GetBossDungeonWood_BossMainUis(ui:GetChild("BossMain"))
  uis.root = ui
  return uis
end
