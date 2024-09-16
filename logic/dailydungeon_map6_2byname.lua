require("DailyDungeon_CircleByName")
require("DailyDungeon_Map6PatternAniByName")
require("DailyDungeon_MapTipsByName")

function GetDailyDungeon_Map6_2Uis(ui)
  local uis = {}
  uis.Circle = GetDailyDungeon_CircleUis(ui:GetChild("Circle"))
  uis.PatternAni = GetDailyDungeon_Map6PatternAniUis(ui:GetChild("PatternAni"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Tips1 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips3"))
  uis.root = ui
  return uis
end
