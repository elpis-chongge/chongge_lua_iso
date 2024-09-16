require("RogueBuild01_InsideMapEvent_Line_10001ByName")
require("RogueBuild01_InsideMapEvent_Battle1ByName")
require("RogueBuild01_InsideMapEvent_PlotByName")
require("RogueBuild01_InsideMapEvent_ShopByName")

function GetRogueBuild01_Map_101Uis(ui)
  local uis = {}
  uis.n24 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n24"))
  uis.n25 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n25"))
  uis.n26 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n26"))
  uis.n27 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n27"))
  uis.n28 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n28"))
  uis.n29 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n29"))
  uis.n30 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n30"))
  uis.n31 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n31"))
  uis.n32 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n32"))
  uis.n33 = GetRogueBuild01_InsideMapEvent_Line_10001Uis(ui:GetChild("n33"))
  uis.Dot_A_01 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_A_01"))
  uis.Dot_B_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_B_01"))
  uis.Dot_B_02 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_B_02"))
  uis.Dot_C_01 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_C_01"))
  uis.Dot_D_01 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_D_01"))
  uis.Dot_D_02 = GetRogueBuild01_InsideMapEvent_Battle1Uis(ui:GetChild("Dot_D_02"))
  uis.Dot_D_03 = GetRogueBuild01_InsideMapEvent_PlotUis(ui:GetChild("Dot_D_03"))
  uis.Dot_E_01 = GetRogueBuild01_InsideMapEvent_ShopUis(ui:GetChild("Dot_E_01"))
  uis.root = ui
  return uis
end
