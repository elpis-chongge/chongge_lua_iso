function GetPlotPlay_OptionUis(ui)
  local uis = {}
  
  uis.TimeProgressBar = ui:GetChild("TimeProgressBar")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
