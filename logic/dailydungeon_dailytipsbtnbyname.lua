require("DailyDungeon_DailyTipsPicByName")

function GetDailyDungeon_DailyTipsBtnUis(ui)
  local uis = {}
  uis.DailyTipsPic = GetDailyDungeon_DailyTipsPicUis(ui:GetChild("DailyTipsPic"))
  uis.touchCtr = ui:GetController("touch")
  uis.root = ui
  return uis
end
