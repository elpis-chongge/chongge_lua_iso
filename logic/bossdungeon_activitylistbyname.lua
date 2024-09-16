require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")
require("BossDungeon_TitleByName")
require("BossDungeon_TimeByName")

function GetBossDungeon_ActivityListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.Title = GetBossDungeon_TitleUis(ui:GetChild("Title"))
  uis.Time = GetBossDungeon_TimeUis(ui:GetChild("Time"))
  uis.BossList = ui:GetChild("BossList")
  uis.root = ui
  return uis
end
