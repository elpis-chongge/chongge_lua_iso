require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideEndDetailsTitleByName")
require("RogueBuild01_InsideEndDetailsRegion1ByName")
require("RogueBuild01_InsideEndDetailsRegion2ByName")

function GetRogueBuild01_InsideEndDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetRogueBuild01_InsideEndDetailsTitleUis(ui:GetChild("Title"))
  uis.Region1 = GetRogueBuild01_InsideEndDetailsRegion1Uis(ui:GetChild("Region1"))
  uis.Region2 = GetRogueBuild01_InsideEndDetailsRegion2Uis(ui:GetChild("Region2"))
  uis.NextBtn = ui:GetChild("NextBtn")
  uis.LastBtn = ui:GetChild("LastBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
