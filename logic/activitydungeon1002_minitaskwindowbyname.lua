require("ActivityDungeon1002_MiniTaskByName")

function GetActivityDungeon1002_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
