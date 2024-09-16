require("CommonResource_BackGroundByName")
require("BossDungeon_TimeByName")
require("BossDungeon_BossLoadModuleByName")
require("BossDungeon_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetBossDungeon_BossDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Time = GetBossDungeon_TimeUis(ui:GetChild("Time"))
  uis.BossLoadModule = GetBossDungeon_BossLoadModuleUis(ui:GetChild("BossLoadModule"))
  uis.TabRegion = GetBossDungeon_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
