require("CommonResource_BackGroundByName")
require("RogueBuild01_DayRewardByName")
require("RogueBuild01_AchieveRewardByName")
require("RogueBuild01_LetterRewardTabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_LetterRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.DayReward = GetRogueBuild01_DayRewardUis(ui:GetChild("DayReward"))
  uis.AchieveReward = GetRogueBuild01_AchieveRewardUis(ui:GetChild("AchieveReward"))
  uis.TabRegion = GetRogueBuild01_LetterRewardTabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
