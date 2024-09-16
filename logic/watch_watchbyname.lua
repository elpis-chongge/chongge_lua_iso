require("CommonResource_BackGroundByName")
require("Watch_ClothesSetByName")
require("CommonResource_CurrencyReturnByName")

function GetWatch_WatchUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ClothesSet = GetWatch_ClothesSetUis(ui:GetChild("ClothesSet"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
