require("BossDungeonWood_TitleByName")
require("BossDungeonWood_OpinionByName")
require("BossDungeonWood_BuffByName")
require("BossDungeonWood_RewardByName")
require("BossDungeonWood_ButtonRegionByName")

function GetBossDungeonWood_InfoUis(ui)
  local uis = {}
  uis.Title = GetBossDungeonWood_TitleUis(ui:GetChild("Title"))
  uis.Opinion = GetBossDungeonWood_OpinionUis(ui:GetChild("Opinion"))
  uis.Buff = GetBossDungeonWood_BuffUis(ui:GetChild("Buff"))
  uis.Reward = GetBossDungeonWood_RewardUis(ui:GetChild("Reward"))
  uis.ButtonRegion = GetBossDungeonWood_ButtonRegionUis(ui:GetChild("ButtonRegion"))
  uis.root = ui
  return uis
end
