require("BossDungeon_BossDungeonByName")

function GetBossDungeon_BossDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeon_BossDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
