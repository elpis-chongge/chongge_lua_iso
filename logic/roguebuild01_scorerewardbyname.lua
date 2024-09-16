require("CommonResource_BackGroundByName")
require("RogueBuild01_ScoreRewardShowByName")
require("RogueBuild01_ScoreRewardListRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_ScoreRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Show = GetRogueBuild01_ScoreRewardShowUis(ui:GetChild("Show"))
  uis.RewardList = GetRogueBuild01_ScoreRewardListRegionUis(ui:GetChild("RewardList"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
