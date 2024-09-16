require("DailyDungeon_DailyMapByName")

function GetDailyDungeon_DailyMapWindowUis(ui)
  local uis = {}
  uis.Main = GetDailyDungeon_DailyMapUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
