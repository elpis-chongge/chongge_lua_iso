require("RogueBuild01_InsideMapEvent_PlotByName")
require("RogueBuild01_InsideMapEvent_Battle1ByName")
require("RogueBuild01_InsideMapEvent_Battle2ByName")
require("RogueBuild01_InsideMapEvent_CampByName")
require("RogueBuild01_InsideMapEvent_ShopByName")

function GetRogueBuild01_Map_401Uis(ui)
  local uis = {}
  uis.Dot_A_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_A_01"))
  uis.Dot_B_01 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_B_01"))
  uis.Dot_B_02 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_B_02"))
  uis.Dot_C_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_C_01"))
  uis.Dot_D_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_D_01"))
  uis.Dot_D_02 = GetRogueBuild01_InsideMapEvent_Battle2Uis(ui:GetChild("Dot_D_02"))
  uis.Dot_E_01 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_E_01"))
  uis.Dot_F_01 = GetRogueBuild01_InsideMapEvent_CampUis(ui:GetChild("Dot_F_01"))
  uis.Dot_F_02 = GetRogueBuild01_InsideMapEvent_ShopUis(ui:GetChild("Dot_F_02"))
  uis.root = ui
  return uis
end
