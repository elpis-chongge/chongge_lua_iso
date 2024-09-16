require("TideDungeon_DungeonTipsByName")

function GetTideDungeon_DungeonTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetTideDungeon_DungeonTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
