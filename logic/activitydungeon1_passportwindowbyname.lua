require("ActivityDungeon1_PassportByName")

function GetActivityDungeon1_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
