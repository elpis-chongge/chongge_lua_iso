require("DailyDungeon_Map6PatternByName")

function GetDailyDungeon_Map6PatternAniUis(ui)
  local uis = {}
  uis.Pattern = GetDailyDungeon_Map6PatternUis(ui:GetChild("Pattern"))
  uis.root = ui
  return uis
end
