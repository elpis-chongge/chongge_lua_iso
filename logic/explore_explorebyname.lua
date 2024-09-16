require("CommonResource_BackGroundByName")
require("Explore_ExploreWordByName")
require("Explore_ExploreTouchWordByName")
require("CommonResource_CurrencyReturnByName")

function GetExplore_ExploreUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Word = GetExplore_ExploreWordUis(ui:GetChild("Word"))
  uis.TouchWord = GetExplore_ExploreTouchWordUis(ui:GetChild("TouchWord"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
