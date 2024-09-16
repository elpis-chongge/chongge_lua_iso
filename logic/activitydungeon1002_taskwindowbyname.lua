require("ActivityDungeon1002_TaskByName")

function GetActivityDungeon1002_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
