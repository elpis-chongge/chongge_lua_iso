function GetPlotPlayEditor_CardSpeakUis(ui)
  local uis = {}
  
  uis.IsSpeakerBtn = ui:GetChild("IsSpeakerBtn")
  uis.IsLightBtn = ui:GetChild("IsLightBtn")
  uis.root = ui
  return uis
end
