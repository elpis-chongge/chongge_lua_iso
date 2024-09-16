require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideStartChoiceTitleByName")
require("RogueBuild01_InsideMapBottomByName")

function GetRogueBuild01_InsideStartChoiceUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetRogueBuild01_InsideStartChoiceTitleUis(ui:GetChild("Title"))
  uis.NextBtn = ui:GetChild("NextBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.CardList = ui:GetChild("CardList")
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
