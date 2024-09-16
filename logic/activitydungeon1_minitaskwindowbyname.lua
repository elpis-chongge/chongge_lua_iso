require("ActivityDungeon1_MiniTaskByName")

function GetActivityDungeon1_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
