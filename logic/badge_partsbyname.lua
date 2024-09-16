require("Badge_PartsLevelByName")

function GetBadge_PartsUis(ui)
  local uis = {}
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.Level = GetBadge_PartsLevelUis(ui:GetChild("Level"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.EffectHolder1 = ui:GetChild("EffectHolder1")
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c3Ctr = ui:GetController("c3")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
