require("ActivityDungeon1002_MaterialByName")

function GetActivityDungeon1002_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
