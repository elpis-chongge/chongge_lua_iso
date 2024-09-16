require("DailyDungeon_CircleByName")
require("DailyDungeon_MapTipsByName")

function GetDailyDungeon_Map1Uis(ui)
  local uis = {}
  uis.Circle = GetDailyDungeon_CircleUis(ui:GetChild("Circle"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Tips1 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips3"))
  uis.Tips4 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips4"))
  uis.Tips5 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips5"))
  uis.root = ui
  return uis
end
