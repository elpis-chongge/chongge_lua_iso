require("CommonResource_BackGroundByName")
require("Story_MainPlotReviewByName")
require("Story_CGByName")
require("Story_MusicByName")
require("Story_MonsterByName")
require("Story_ItemByName")
require("Story_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetStory_StoryUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainPlotReview = GetStory_MainPlotReviewUis(ui:GetChild("MainPlotReview"))
  uis.BranchPlotReview = GetStory_MainPlotReviewUis(ui:GetChild("BranchPlotReview"))
  uis.CG = GetStory_CGUis(ui:GetChild("CG"))
  uis.Music = GetStory_MusicUis(ui:GetChild("Music"))
  uis.Monster = GetStory_MonsterUis(ui:GetChild("Monster"))
  uis.Item = GetStory_ItemUis(ui:GetChild("Item"))
  uis.TabRegion = GetStory_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
