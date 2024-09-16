function GetInitialCarnival_TargetUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IntegralTxt = ui:GetChild("IntegralTxt")
  uis.root = ui
  return uis
end
