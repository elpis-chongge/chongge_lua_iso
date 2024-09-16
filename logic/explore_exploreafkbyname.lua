require("CommonResource_BackGroundByName")
require("Explore_AFKTitleByName")
require("Explore_AFKRewardInfoByName")
require("Explore_AFKRegoinByName")
require("Explore_AFKStartTipsByName")
require("CommonResource_CurrencyReturnByName")

function GetExplore_ExploreAFKUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.AFKTitle = GetExplore_AFKTitleUis(ui:GetChild("AFKTitle"))
  uis.AFKRewardInfo = GetExplore_AFKRewardInfoUis(ui:GetChild("AFKRewardInfo"))
  uis.AFKRegoin = GetExplore_AFKRegoinUis(ui:GetChild("AFKRegoin"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.AFKStartTips = GetExplore_AFKStartTipsUis(ui:GetChild("AFKStartTips"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
