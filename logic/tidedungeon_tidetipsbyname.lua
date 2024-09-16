require("TideDungeon_TideCompleteByName")
require("TideDungeon_TideLockByName")

function GetTideDungeon_TideTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TideComplete = GetTideDungeon_TideCompleteUis(ui:GetChild("TideComplete"))
  uis.TideLock = GetTideDungeon_TideLockUis(ui:GetChild("TideLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
