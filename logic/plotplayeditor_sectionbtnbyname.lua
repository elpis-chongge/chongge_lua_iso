function GetPlotPlayEditor_SectionBtnUis(ui)
  local uis = {}
  
  uis.IdTxt = ui:GetChild("IdTxt")
  uis.IndexCBox = ui:GetChild("IndexCBox")
  uis.BgHolder = ui:GetChild("BgHolder")
  uis.BgLoader = ui:GetChild("BgLoader")
  uis.EffectInCBox = ui:GetChild("EffectInCBox")
  uis.EffectOutCBox = ui:GetChild("EffectOutCBox")
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.SkipStopBtn = ui:GetChild("SkipStopBtn")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
