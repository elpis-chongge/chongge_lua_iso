require("SuperDungeon_PlayDetailsByName")

function GetSuperDungeon_PlayDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetSuperDungeon_PlayDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
