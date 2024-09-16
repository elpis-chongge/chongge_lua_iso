require("RogueBuild01_InsideMapEvent_Battle1ByName")
require("RogueBuild01_InsideMapEvent_Battle2ByName")
require("RogueBuild01_InsideMapEvent_Battle3ByName")
require("RogueBuild01_InsideMapEvent_CampByName")
require("RogueBuild01_InsideMapEvent_PlotByName")
require("RogueBuild01_InsideMapEvent_ShopByName")

function GetRogueBuild01_InsideMapEvent_AllUis(ui)
  local uis = {}
  uis.Battle1 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Battle1"))
  uis.Battle2 = GetRogueBuild01_InsideMapEvent_Battle2Uis(ui:GetChild("Battle2"))
  uis.Battle3 = GetRogueBuild01_InsideMapEvent_Battle3Uis(ui:GetChild("Battle3"))
  uis.Camp = GetRogueBuild01_InsideMapEvent_CampUis(ui:GetChild("Camp"))
  uis.Plot = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Plot"))
  uis.Shop = GetRogueBuild01_InsideMapEvent_ShopUis(ui:GetChild("Shop"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
