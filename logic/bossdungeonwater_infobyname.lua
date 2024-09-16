require("BossDungeonWater_TitleByName")
require("BossDungeonWater_OpinionByName")
require("BossDungeonWater_BuffByName")
require("BossDungeonWater_RewardByName")
require("BossDungeonWater_ButtonRegionByName")

function GetBossDungeonWater_InfoUis(ui)
  local uis = {}
  uis.Title = GetBossDungeonWater_TitleUis(ui:GetChild("Title"))
  uis.Opinion = GetBossDungeonWater_OpinionUis(ui:GetChild("Opinion"))
  uis.Buff = GetBossDungeonWater_BuffUis(ui:GetChild("Buff"))
  uis.Reward = GetBossDungeonWater_RewardUis(ui:GetChild("Reward"))
  uis.ButtonRegion = GetBossDungeonWater_ButtonRegionUis(ui:GetChild("ButtonRegion"))
  uis.root = ui
  return uis
end
