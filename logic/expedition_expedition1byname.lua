require("CommonResource_BackGroundByName")
require("Expedition_CoverTitleByName")
require("Expedition_CoverTimeByName")
require("CommonResource_CurrencyReturnByName")

function GetExpedition_Expedition1Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CoverTitle = GetExpedition_CoverTitleUis(ui:GetChild("CoverTitle"))
  uis.CoverStartBtn = ui:GetChild("CoverStartBtn")
  uis.CoverTime = GetExpedition_CoverTimeUis(ui:GetChild("CoverTime"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.ReviewBtn = ui:GetChild("ReviewBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
