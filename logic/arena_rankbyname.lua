require("CommonResource_BackGroundByName")
require("Arena_TitleByName")
require("Arena_GloryByName")
require("Arena_NowRankByName")
require("CommonResource_CurrencyReturnByName")

function GetArena_RankUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetArena_TitleUis(ui:GetChild("Title"))
  uis.RewardTipsList = ui:GetChild("RewardTipsList")
  uis.Glory = GetArena_GloryUis(ui:GetChild("Glory"))
  uis.NowRank = GetArena_NowRankUis(ui:GetChild("NowRank"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
