require("ActivityDungeon1001_SignByName")

function GetActivityDungeon1001_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
