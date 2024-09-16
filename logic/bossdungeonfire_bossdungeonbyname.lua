require("BossDungeonFire_BossMainByName")

function GetBossDungeonFire_BossDungeonUis(ui)
  local uis = {}
  uis.BossMain = GetBossDungeonFire_BossMainUis(ui:GetChild("BossMain"))
  uis.root = ui
  return uis
end
