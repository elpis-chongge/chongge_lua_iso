require("CommonResource_BackGroundByName")
require("Card_StarUp1ByName")
require("Card_StarUp2ByName")

function GetCard_CardStarUpUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ResourcesHolder = ui:GetChild("ResourcesHolder")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.StarUp1 = GetCard_StarUp1Uis(ui:GetChild("StarUp1"))
  uis.StarUp2 = GetCard_StarUp2Uis(ui:GetChild("StarUp2"))
  uis.StarUpBtn = ui:GetChild("StarUpBtn")
  uis.StarExchangeBtn = ui:GetChild("StarExchangeBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
