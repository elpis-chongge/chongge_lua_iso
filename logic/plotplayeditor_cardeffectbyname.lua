function GetPlotPlayEditor_CardEffectUis(ui)
  local uis = {}
  
  uis.EffectInCBox = ui:GetChild("EffectInCBox")
  uis.EffectOutCBox = ui:GetChild("EffectOutCBox")
  uis.CardEffectCBox = ui:GetChild("CardEffectCBox")
  uis.InParamTxt = ui:GetChild("InParamTxt")
  uis.OutParamTxt = ui:GetChild("OutParamTxt")
  uis.root = ui
  return uis
end
