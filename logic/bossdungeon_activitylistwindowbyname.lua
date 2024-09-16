require("BossDungeon_ActivityListByName")

function GetBossDungeon_ActivityListWindowUis(ui)
  local uis = {}
  uis.Main = GetBossDungeon_ActivityListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
