require("CommonResource_BackGroundByName")
require("Expedition_ReviewTabRegionByName")
require("Expedition_ReviewTitleByName")
require("Expedition_ReviewProgressByName")
require("CommonResource_CurrencyReturnByName")

function GetExpedition_BattleReviewUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReviewTabRegion = GetExpedition_ReviewTabRegionUis(ui:GetChild("ReviewTabRegion"))
  uis.ReviewTitle = GetExpedition_ReviewTitleUis(ui:GetChild("ReviewTitle"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.ReviewProgress = GetExpedition_ReviewProgressUis(ui:GetChild("ReviewProgress"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
