require("DailyDungeon_TypeIcon1ByName")
require("DailyDungeon_TypeIcon2ByName")

function GetDailyDungeon_DailyTipsWordUis(ui)
  local uis = {}
  uis.TypeIcon1 = GetDailyDungeon_TypeIcon1Uis(ui:GetChild("TypeIcon1"))
  uis.TypeIcon2 = GetDailyDungeon_TypeIcon2Uis(ui:GetChild("TypeIcon2"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
