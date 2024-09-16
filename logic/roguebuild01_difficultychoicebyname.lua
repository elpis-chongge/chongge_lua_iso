require("CommonResource_BackGroundByName")
require("RogueBuild01_DifficultyPositionShowByName")
require("RogueBuild01_DifficultyTipsByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_DifficultyChoiceUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PositionShow = GetRogueBuild01_DifficultyPositionShowUis(ui:GetChild("PositionShow"))
  uis.DifficultyTips = GetRogueBuild01_DifficultyTipsUis(ui:GetChild("DifficultyTips"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
