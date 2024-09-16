function GetPlotPlayEditor_OptionUis(ui)
  local uis = {}
  
  uis.OptionTxt = ui:GetChild("OptionTxt")
  uis.JumpCBox = ui:GetChild("JumpCBox")
  uis.root = ui
  return uis
end
