require("CommonResource_BackGroundByName")
require("RogueBuild01_BookTreasureTipsByName")
require("RogueBuild01_BookSacredTipsByName")
require("RogueBuild01_BookTabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_BookTreasureUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BookTreasureTips = GetRogueBuild01_BookTreasureTipsUis(ui:GetChild("BookTreasureTips"))
  uis.BookSacredTips = GetRogueBuild01_BookSacredTipsUis(ui:GetChild("BookSacredTips"))
  uis.BookTabRegion = GetRogueBuild01_BookTabRegionUis(ui:GetChild("BookTabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
