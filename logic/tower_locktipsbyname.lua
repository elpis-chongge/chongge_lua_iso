require("Tower_LockTipsBgByName")

function GetTower_LockTipsUis(ui)
  local uis = {}
  uis.LockTipsBg = GetTower_LockTipsBgUis(ui:GetChild("LockTipsBg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GotoBtn = ui:GetChild("GotoBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
