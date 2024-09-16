function GetCommonResource_HeadFrameWaveUis(ui)
  local uis = {}
  
  uis.WaveTxt = ui:GetChild("WaveTxt")
  uis.c4Ctr = ui:GetController("c4")
  uis.root = ui
  return uis
end
