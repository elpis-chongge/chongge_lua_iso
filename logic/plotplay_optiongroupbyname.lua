function GetPlotPlay_OptionGroupUis(ui)
  local uis = {}
  
  uis.OptionList = ui:GetChild("OptionList")
  uis.root = ui
  return uis
end
