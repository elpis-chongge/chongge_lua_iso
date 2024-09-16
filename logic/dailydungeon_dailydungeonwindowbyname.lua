require("DailyDungeon_DailyDungeonByName")

function GetDailyDungeon_DailyDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetDailyDungeon_DailyDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
