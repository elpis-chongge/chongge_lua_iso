require("CommonResource_BackGroundByName")
require("Passport_RewardRegionByName")
require("Passport_LevelRegionByName")
require("Passport_TaskRegionByName")
require("Passport_TimeByName")
require("Passport_CardClothesRegionByName")
require("Passport_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetPassport_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetPassport_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.LevelRegion = GetPassport_LevelRegionUis(ui:GetChild("LevelRegion"))
  uis.TaskRegion = GetPassport_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.Time = GetPassport_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.CardClothesRegion = GetPassport_CardClothesRegionUis(ui:GetChild("CardClothesRegion"))
  uis.TabRegion = GetPassport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
