require("CommonResource_BackGroundByName")
require("Adventure_ContentByName")
require("Adventure_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetAdventure_AdventureUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Content = GetAdventure_ContentUis(ui:GetChild("Content"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TabRegion = GetAdventure_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
