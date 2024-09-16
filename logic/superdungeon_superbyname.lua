require("CommonResource_BackGroundByName")
require("SuperDungeon_TitleByName")
require("SuperDungeon_MapDotByName")
require("SuperDungeon_MapBossDotByName")
require("CommonResource_CurrencyReturnByName")

function GetSuperDungeon_SuperUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Title = GetSuperDungeon_TitleUis(ui:GetChild("Title"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.Dot1 = GetSuperDungeon_MapDotUis(ui:GetChild("Dot1"))
  uis.Dot2 = GetSuperDungeon_MapDotUis(ui:GetChild("Dot2"))
  uis.Dot3 = GetSuperDungeon_MapDotUis(ui:GetChild("Dot3"))
  uis.Dot4 = GetSuperDungeon_MapDotUis(ui:GetChild("Dot4"))
  uis.Dot5 = GetSuperDungeon_MapBossDotUis(ui:GetChild("Dot5"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
