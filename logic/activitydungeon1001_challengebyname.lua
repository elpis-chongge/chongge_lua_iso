require("CommonResource_BackGroundByName")
require("ActivityDungeon1001_MapListByName")

function GetActivityDungeon1001_ChallengeUis(ui)
  local uis = {}
  uis.BgList = ui:GetChild("BgList")
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Map = GetActivityDungeon1001_MapListUis(ui:GetChild("Map"))
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.ChapterList = ui:GetChild("ChapterList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
