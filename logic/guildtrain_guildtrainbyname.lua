require("CommonResource_BackGroundByName")
require("GuildTrain_RankRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetGuildTrain_GuildTrainUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RankRegion = GetGuildTrain_RankRegionUis(ui:GetChild("RankRegion"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.TrainStartBtn = ui:GetChild("TrainStartBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
