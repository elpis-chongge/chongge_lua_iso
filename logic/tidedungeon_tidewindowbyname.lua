require("TideDungeon_TideByName")

function GetTideDungeon_TideWindowUis(ui)
  local uis = {}
  uis.Main = GetTideDungeon_TideUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
