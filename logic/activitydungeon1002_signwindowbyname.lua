require("ActivityDungeon1002_SignByName")

function GetActivityDungeon1002_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
