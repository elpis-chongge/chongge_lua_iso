require("CommonResource_BackGroundByName")
require("Arena_TitleByName")
require("Arena_SeasonTimeByName")
require("Arena_TabRegionByName")
require("Arena_RewardTipsListByName")
require("CommonResource_CurrencyReturnByName")

function GetArena_RewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetArena_TitleUis(ui:GetChild("Title"))
  uis.Time = GetArena_SeasonTimeUis(ui:GetChild("Time"))
  uis.TabRegion = GetArena_TabRegionUis(ui:GetChild("TabRegion"))
  uis.RewardTipsList = GetArena_RewardTipsListUis(ui:GetChild("RewardTipsList"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
