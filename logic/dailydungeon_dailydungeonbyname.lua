require("CommonResource_BackGroundByName")
require("DailyDungeon_DailyEffectByName")
require("CommonResource_CurrencyReturnByName")

function GetDailyDungeon_DailyDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Effect1 = GetDailyDungeon_DailyEffectUis(ui:GetChild("Effect1"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.Effect2 = GetDailyDungeon_DailyEffectUis(ui:GetChild("Effect2"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
