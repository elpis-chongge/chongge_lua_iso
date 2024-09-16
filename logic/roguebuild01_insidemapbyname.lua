require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideMapLayerByName")
require("RogueBuild01_MapListByName")
require("RogueBuild01_InsideMapBottomByName")

function GetRogueBuild01_InsideMapUis(ui)
  local uis = {}
  uis.BgList = ui:GetChild("BgList")
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Layer = GetRogueBuild01_InsideMapLayerUis(ui:GetChild("Layer"))
  uis.MapList = GetRogueBuild01_MapListUis(ui:GetChild("MapList"))
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
