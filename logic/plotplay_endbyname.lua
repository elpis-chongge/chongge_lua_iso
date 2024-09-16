function GetPlotPlay_EndUis(ui)
  local uis = {}
  
  uis.EffectLoader = ui:GetChild("EffectLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TitleElpisTxt = ui:GetChild("TitleElpisTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.root = ui
  return uis
end
