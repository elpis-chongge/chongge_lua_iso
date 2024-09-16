require("CommonResource_BackGroundByName")
require("PlotDungeon_DungeonMapByName")
require("PlotDungeon_TitleByName")
require("PlotDungeon_RightRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetPlotDungeon_PlotDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.DungeonMap = GetPlotDungeon_DungeonMapUis(ui:GetChild("DungeonMap"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Title = GetPlotDungeon_TitleUis(ui:GetChild("Title"))
  uis.ChapterRewardBtn = ui:GetChild("ChapterRewardBtn")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightRegion = GetPlotDungeon_RightRegionUis(ui:GetChild("RightRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
