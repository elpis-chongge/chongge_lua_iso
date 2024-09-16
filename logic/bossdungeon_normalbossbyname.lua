require("BossDungeon_BossPicByName")
require("BossDungeon_BossInfoByName")

function GetBossDungeon_NormalBossUis(ui)
  local uis = {}
  uis.BossPic = GetBossDungeon_BossPicUis(ui:GetChild("BossPic"))
  uis.BossInfo = GetBossDungeon_BossInfoUis(ui:GetChild("BossInfo"))
  uis.root = ui
  return uis
end
