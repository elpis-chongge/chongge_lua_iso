require("DailyDungeon_Map4PatternByName")

function GetDailyDungeon_Map4PatternAniUis(ui)
  local uis = {}
  uis.Pattern = GetDailyDungeon_Map4PatternUis(ui:GetChild("Pattern"))
  uis.root = ui
  return uis
end
