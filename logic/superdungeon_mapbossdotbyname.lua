require("SuperDungeon_LockByName")

function GetSuperDungeon_MapBossDotUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.Lock1 = GetSuperDungeon_LockUis(ui:GetChild("Lock1"))
  uis.Lock2 = GetSuperDungeon_LockUis(ui:GetChild("Lock2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
