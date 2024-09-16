require("DailyDungeon_Map5PatternByName")

function GetDailyDungeon_Map5PatternAniUis(ui)
  local uis = {}
  uis.Pattern = GetDailyDungeon_Map5PatternUis(ui:GetChild("Pattern"))
  uis.root = ui
  return uis
end
