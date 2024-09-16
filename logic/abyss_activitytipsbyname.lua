require("Abyss_BossRegionByName")
require("Abyss_ExpeditionRegionByName")
require("Abyss_BuildRegionByName")
require("Abyss_BoxRegionByName")
require("Abyss_RogueRegionByName")
require("Abyss_SuperRegionByName")
require("Abyss_ExploreRegionByName")

function GetAbyss_ActivityTipsUis(ui)
  local uis = {}
  uis.TitleList = ui:GetChild("TitleList")
  uis.TabList = ui:GetChild("TabList")
  uis.BossRegion = GetAbyss_BossRegionUis(ui:GetChild("BossRegion"))
  uis.ExpeditionRegion = GetAbyss_ExpeditionRegionUis(ui:GetChild("ExpeditionRegion"))
  uis.BuildRegion = GetAbyss_BuildRegionUis(ui:GetChild("BuildRegion"))
  uis.BoxRegion = GetAbyss_BoxRegionUis(ui:GetChild("BoxRegion"))
  uis.RogueRegion = GetAbyss_RogueRegionUis(ui:GetChild("RogueRegion"))
  uis.SuperRegion = GetAbyss_SuperRegionUis(ui:GetChild("SuperRegion"))
  uis.ExploreRegion = GetAbyss_ExploreRegionUis(ui:GetChild("ExploreRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
