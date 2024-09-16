require("PlotPlayEditor_DialogCardByName")
require("PlotPlayEditor_DialogEffectByName")
require("PlotPlayEditor_DialogTextByName")
require("PlotPlayEditor_HeadByName")
require("PlotPlayEditor_DialogAnimationByName")
require("PlotPlayEditor_DialogCGByName")
require("PlotPlayEditor_DialogOpenByName")

function GetPlotPlayEditor_DialogEditUis(ui)
  local uis = {}
  uis.TabList = ui:GetChild("TabList")
  uis.Card = GetPlotPlayEditor_DialogCardUis(ui:GetChild("Card"))
  uis.Effect = GetPlotPlayEditor_DialogEffectUis(ui:GetChild("Effect"))
  uis.Text = GetPlotPlayEditor_DialogTextUis(ui:GetChild("Text"))
  uis.Head = GetPlotPlayEditor_HeadUis(ui:GetChild("Head"))
  uis.Animation = GetPlotPlayEditor_DialogAnimationUis(ui:GetChild("Animation"))
  uis.CG = GetPlotPlayEditor_DialogCGUis(ui:GetChild("CG"))
  uis.Open = GetPlotPlayEditor_DialogOpenUis(ui:GetChild("Open"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
