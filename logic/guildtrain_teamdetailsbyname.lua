require("CommonResource_BackGroundByName")
require("GuildTrain_TotalDamageByName")
require("GuildTrain_TotalTimeByName")
require("GuildTrain_FormationGridLineByName")
require("GuildTrain_BurstStripByName")
require("CommonResource_CurrencyReturnByName")

function GetGuildTrain_TeamDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TotalDamage = GetGuildTrain_TotalDamageUis(ui:GetChild("TotalDamage"))
  uis.TotalTime = GetGuildTrain_TotalTimeUis(ui:GetChild("TotalTime"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.GirdRoot = GetGuildTrain_FormationGridLineUis(ui:GetChild("GirdRoot"))
  uis.BurstStrip = GetGuildTrain_BurstStripUis(ui:GetChild("BurstStrip"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
