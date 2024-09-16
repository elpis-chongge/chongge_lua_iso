require("BossDungeonFire_TitleByName")
require("BossDungeonFire_OpinionByName")
require("BossDungeonFire_BuffByName")
require("BossDungeonFire_RewardByName")
require("BossDungeonFire_ButtonRegionByName")

function GetBossDungeonFire_InfoUis(ui)
  local uis = {}
  uis.Title = GetBossDungeonFire_TitleUis(ui:GetChild("Title"))
  uis.Opinion = GetBossDungeonFire_OpinionUis(ui:GetChild("Opinion"))
  uis.Buff = GetBossDungeonFire_BuffUis(ui:GetChild("Buff"))
  uis.Reward = GetBossDungeonFire_RewardUis(ui:GetChild("Reward"))
  uis.ButtonRegion = GetBossDungeonFire_ButtonRegionUis(ui:GetChild("ButtonRegion"))
  uis.root = ui
  return uis
end
