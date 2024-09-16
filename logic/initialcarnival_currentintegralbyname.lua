function GetInitialCarnival_CurrentIntegralUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
