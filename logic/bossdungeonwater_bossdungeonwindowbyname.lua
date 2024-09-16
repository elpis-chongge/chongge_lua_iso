require("BossDungeonWater_BossDungeonByName")

function GetBossDungeonWater_BossDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeonWater_BossDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
