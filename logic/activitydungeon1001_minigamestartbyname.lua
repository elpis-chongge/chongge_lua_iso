require("CommonResource_BackGroundByName")
require("ActivityDungeon1001_MiniStart_MidRegionByName")
require("ActivityDungeon1001_MiniStart_LeftRegionByName")
require("ActivityDungeon1001_MiniStart_RightRegionByName")

function GetActivityDungeon1001_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MidRegion = GetActivityDungeon1001_MiniStart_MidRegionUis(ui:GetChild("MidRegion"))
  uis.LeftRegion = GetActivityDungeon1001_MiniStart_LeftRegionUis(ui:GetChild("LeftRegion"))
  uis.RightRegion = GetActivityDungeon1001_MiniStart_RightRegionUis(ui:GetChild("RightRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
