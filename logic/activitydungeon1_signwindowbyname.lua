require("ActivityDungeon1_SignByName")

function GetActivityDungeon1_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
