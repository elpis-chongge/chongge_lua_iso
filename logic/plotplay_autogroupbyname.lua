require("PlotPlay_NextStepByName")

function GetPlotPlay_AutoGroupUis(ui)
  local uis = {}
  uis.NextStep = GetPlotPlay_NextStepUis(ui:GetChild("NextStep"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
