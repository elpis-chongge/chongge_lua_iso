require("ActivityDungeon1_ActivityDungeonByName")

function GetActivityDungeon1_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
