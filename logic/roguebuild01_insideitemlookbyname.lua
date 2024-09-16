require("CommonResource_BackGroundByName")
require("RogueBuild01_ItemLook_TreasureTipsByName")
require("RogueBuild01_ItemLook_SacredTipsByName")
require("RogueBuild01_ItemLook_TabRegionByName")

function GetRogueBuild01_InsideItemLookUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TreasureTips = GetRogueBuild01_ItemLook_TreasureTipsUis(ui:GetChild("TreasureTips"))
  uis.SacredTips = GetRogueBuild01_ItemLook_SacredTipsUis(ui:GetChild("SacredTips"))
  uis.TabRegion = GetRogueBuild01_ItemLook_TabRegionUis(ui:GetChild("TabRegion"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
