require("ActivityDungeon1001_MiniTaskByName")

function GetActivityDungeon1001_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
