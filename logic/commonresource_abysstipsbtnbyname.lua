function GetCommonResource_AbyssTipsBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
