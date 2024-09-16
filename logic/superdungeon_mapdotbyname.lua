require("SuperDungeon_LockByName")
require("SuperDungeon_MapDotBuffNumberByName")

function GetSuperDungeon_MapDotUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.Lock = GetSuperDungeon_LockUis(ui:GetChild("Lock"))
  uis.BuffNumber = GetSuperDungeon_MapDotBuffNumberUis(ui:GetChild("BuffNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
