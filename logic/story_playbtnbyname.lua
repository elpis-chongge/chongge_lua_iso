function GetStory_PlayBtnUis(ui)
  local uis = {}
  
  uis.EffectLoader = ui:GetChild("EffectLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
