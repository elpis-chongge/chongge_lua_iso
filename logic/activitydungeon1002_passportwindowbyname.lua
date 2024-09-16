require("ActivityDungeon1002_PassportByName")

function GetActivityDungeon1002_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
