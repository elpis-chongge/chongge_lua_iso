require("ActivityDungeon1001_MaterialByName")

function GetActivityDungeon1001_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
