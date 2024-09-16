function GetRogueBuild01_DungeonInfo_MidEffectUis(ui)
  local uis = {}
  
  uis.EffectTxt = ui:GetChild("EffectTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
