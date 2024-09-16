require("DailyDungeon_DailyTipsWordByName")

function GetDailyDungeon_DailyTipsPicUis(ui)
  local uis = {}
  uis.Line135Image = ui:GetChild("Line135Image")
  uis.Line24Image = ui:GetChild("Line24Image")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.DailyTipsWord = GetDailyDungeon_DailyTipsWordUis(ui:GetChild("DailyTipsWord"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
