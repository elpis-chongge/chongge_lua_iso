require("ActivityDungeon1_MaterialByName")

function GetActivityDungeon1_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
