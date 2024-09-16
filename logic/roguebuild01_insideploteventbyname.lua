require("CommonResource_BackGroundByName")
require("RogueBuild01_PlotEvent_WordByName")
require("RogueBuild01_InsideMapBottomByName")

function GetRogueBuild01_InsidePlotEventUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.Word = GetRogueBuild01_PlotEvent_WordUis(ui:GetChild("Word"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.NextBtn = ui:GetChild("NextBtn")
  uis.OptionList = ui:GetChild("OptionList")
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
