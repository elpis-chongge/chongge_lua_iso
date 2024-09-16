require("BossDungeonFire_BossDungeonByName")

function GetBossDungeonFire_BossDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonFire_BossDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
