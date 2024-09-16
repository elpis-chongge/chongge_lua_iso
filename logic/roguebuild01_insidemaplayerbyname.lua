require("RogueBuild01_InsideMapLayer_Dot1ByName")
require("RogueBuild01_InsideMapLayer_Dot2ByName")
require("RogueBuild01_InsideMapLayer_Dot3ByName")
require("RogueBuild01_InsideMapLayer_Dot4ByName")
require("RogueBuild01_InsideMapLayer_Dot5ByName")
require("RogueBuild01_InsideMapLayer_DotSpByName")

function GetRogueBuild01_InsideMapLayerUis(ui)
  local uis = {}
  uis.Dot1 = GetRogueBuild01_InsideMapLayer_Dot1Uis(ui:GetChild("Dot1"))
  uis.Dot2 = GetRogueBuild01_InsideMapLayer_Dot2Uis(ui:GetChild("Dot2"))
  uis.Dot3 = GetRogueBuild01_InsideMapLayer_Dot3Uis(ui:GetChild("Dot3"))
  uis.Dot4 = GetRogueBuild01_InsideMapLayer_Dot4Uis(ui:GetChild("Dot4"))
  uis.Dot5 = GetRogueBuild01_InsideMapLayer_Dot5Uis(ui:GetChild("Dot5"))
  uis.DotSp = GetRogueBuild01_InsideMapLayer_DotSpUis(ui:GetChild("DotSp"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
