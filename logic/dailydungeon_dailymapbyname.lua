require("CommonResource_BackGroundByName")
require("DailyDungeon_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetDailyDungeon_DailyMapUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MapList = ui:GetChild("MapList")
  uis.TabRegion = GetDailyDungeon_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
