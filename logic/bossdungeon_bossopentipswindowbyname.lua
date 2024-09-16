require("BossDungeon_BossOpenTipsByName")

function GetBossDungeon_BossOpenTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeon_BossOpenTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
