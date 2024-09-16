function GetPlotPlay_PlotItemUis(ui)
  local uis = {}
  
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
