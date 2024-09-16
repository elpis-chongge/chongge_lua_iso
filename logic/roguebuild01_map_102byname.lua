require("RogueBuild01_InsideMapEvent_Line_10001ByName")
require("RogueBuild01_InsideMapEvent_Battle1ByName")
require("RogueBuild01_InsideMapEvent_PlotByName")
require("RogueBuild01_InsideMapEvent_ShopByName")

function GetRogueBuild01_Map_102Uis(ui)
  local uis = {}
  uis.n27 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n27"))
  uis.n28 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n28"))
  uis.n29 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n29"))
  uis.n30 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n30"))
  uis.n31 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n31"))
  uis.n33 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n33"))
  uis.n35 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n35"))
  uis.n36 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n36"))
  uis.Dot_A_01 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_A_01"))
  uis.Dot_B_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_B_01"))
  uis.Dot_B_02 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_B_02"))
  uis.Dot_D_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_D_01"))
  uis.Dot_E_01 = GetRogueBuild01_InsideMapEvent_ShopUis(ui:GetChild("Dot_E_01"))
  uis.Dot_C_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_C_01"))
  uis.Dot_C_02 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_C_02"))
  uis.root = ui
  return uis
end
