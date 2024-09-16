require("Badge_IconLockByName")

function GetBadge_ExchangeIconUis(ui)
  local uis = {}
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.IconLock = GetBadge_IconLockUis(ui:GetChild("IconLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.c5Ctr = ui:GetController("c5")
  uis.c6Ctr = ui:GetController("c6")
  uis.root = ui
  return uis
end
