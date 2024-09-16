require("CommonResource_BackGroundByName")
require("Expedition_ChoiceTabRegionByName")
require("Expedition_BattleChoiceTitleByName")
require("CommonResource_CurrencyReturnByName")

function GetExpedition_BattleChoiceUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MapList = ui:GetChild("MapList")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.ReviewBtn = ui:GetChild("ReviewBtn")
  uis.TabRegion = GetExpedition_ChoiceTabRegionUis(ui:GetChild("TabRegion"))
  uis.Title = GetExpedition_BattleChoiceTitleUis(ui:GetChild("Title"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
