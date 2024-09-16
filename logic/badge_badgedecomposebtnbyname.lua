require("Badge_HeadShow1ByName")
require("Badge_IconLockByName")

function GetBadge_BadgeDecomposeBtnUis(ui)
  local uis = {}
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.HeadShow = GetBadge_HeadShow1Uis(ui:GetChild("HeadShow"))
  uis.IconLock = GetBadge_IconLockUis(ui:GetChild("IconLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.button1Ctr = ui:GetController("button1")
  uis.c4Ctr = ui:GetController("c4")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
