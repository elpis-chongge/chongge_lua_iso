require("CommonResource_BackGroundByName")
require("ActivityDungeon1002_MiniStart_MidRegionByName")

function GetActivityDungeon1002_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MidRegion = GetActivityDungeon1002_MiniStart_MidRegionUis(ui:GetChild("MidRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
