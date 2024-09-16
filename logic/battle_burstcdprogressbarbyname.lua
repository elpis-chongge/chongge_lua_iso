require("Battle_BurstCDProgressFillByName")

function GetBattle_BurstCDProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_BurstCDProgressFillUis(ui:GetChild("bar"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
