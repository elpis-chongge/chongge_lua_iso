require("CommonResource_BackGroundByName")
require("TideDungeon_TideRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetTideDungeon_TideUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TideRegion = GetTideDungeon_TideRegionUis(ui:GetChild("TideRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
