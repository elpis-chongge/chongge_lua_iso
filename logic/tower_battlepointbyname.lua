require("Tower_BattlePointDotByName")
require("Tower_BattlePointLockByName")

function GetTower_BattlePointUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.IDLockTxt = ui:GetChild("IDLockTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.BattlePointDot = GetTower_BattlePointDotUis(ui:GetChild("BattlePointDot"))
  uis.BattlePointLock = GetTower_BattlePointLockUis(ui:GetChild("BattlePointLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
