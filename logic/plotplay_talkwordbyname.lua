require("PlotPlay_NpcHeadByName")
require("PlotPlay_LineByName")

function GetPlotPlay_TalkWordUis(ui)
  local uis = {}
  uis.NpcHead = GetPlotPlay_NpcHeadUis(ui:GetChild("NpcHead"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Line = GetPlotPlay_LineUis(ui:GetChild("Line"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
