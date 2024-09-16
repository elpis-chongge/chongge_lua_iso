require("BossDungeonWood_BossDungeonByName")

function GetBossDungeonWood_BossDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonWood_BossDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
