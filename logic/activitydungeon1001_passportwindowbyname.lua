require("ActivityDungeon1001_PassportByName")

function GetActivityDungeon1001_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
