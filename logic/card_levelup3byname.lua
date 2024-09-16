function GetCard_LevelUp3Uis(ui)
  local uis = {}
  
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.LevelAniTxt = ui:GetChild("LevelAniTxt")
  uis.Level1Txt = ui:GetChild("Level1Txt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
