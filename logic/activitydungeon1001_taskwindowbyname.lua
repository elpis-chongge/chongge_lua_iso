require("ActivityDungeon1001_TaskByName")

function GetActivityDungeon1001_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
