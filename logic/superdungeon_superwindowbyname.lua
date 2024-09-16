require("SuperDungeon_SuperByName")

function GetSuperDungeon_SuperWindowUis(ui)
  local uis = {}
  uis.Main = GetSuperDungeon_SuperUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
