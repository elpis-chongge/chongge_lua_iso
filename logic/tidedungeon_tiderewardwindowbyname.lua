require("TideDungeon_TideRewardByName")

function GetTideDungeon_TideRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetTideDungeon_TideRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
