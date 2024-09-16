require("ActivityDungeon1001_ActivityDungeonByName")

function GetActivityDungeon1001_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
