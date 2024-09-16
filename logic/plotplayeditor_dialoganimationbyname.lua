function GetPlotPlayEditor_DialogAnimationUis(ui)
  local uis = {}
  
  uis.AnimationUrlTxt = ui:GetChild("AnimationUrlTxt")
  uis.BattleScriptTxt = ui:GetChild("BattleScriptTxt")
  uis.TextSoundTxt = ui:GetChild("TextSoundTxt")
  uis.EnvSoundTxt = ui:GetChild("EnvSoundTxt")
  uis.SpecialSoundTxt = ui:GetChild("SpecialSoundTxt")
  uis.DelayTimeTxt = ui:GetChild("DelayTimeTxt")
  uis.root = ui
  return uis
end
