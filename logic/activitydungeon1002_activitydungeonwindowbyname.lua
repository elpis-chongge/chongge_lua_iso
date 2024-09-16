require("ActivityDungeon1002_ActivityDungeonByName")

function GetActivityDungeon1002_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
