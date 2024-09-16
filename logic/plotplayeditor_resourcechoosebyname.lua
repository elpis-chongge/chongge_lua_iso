require("PlotPlayEditor_SelectAreaByName")

function GetPlotPlayEditor_ResourceChooseUis(ui)
  local uis = {}
  uis.SelectArea = GetPlotPlayEditor_SelectAreaUis(ui:GetChild("SelectArea"))
  uis.Ratio1Btn = ui:GetChild("Ratio1Btn")
  uis.Ratio2Btn = ui:GetChild("Ratio2Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
