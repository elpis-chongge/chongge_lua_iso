require("ActivityDungeon1_TaskByName")

function GetActivityDungeon1_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
