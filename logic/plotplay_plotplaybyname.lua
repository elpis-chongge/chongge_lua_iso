require("PlotPlay_CardByName")
require("PlotPlay_TalkByName")
require("PlotPlay_PartStartByName")
require("PlotPlay_PlotEffectByName")

function GetPlotPlay_PlotPlayUis(ui)
  local uis = {}
  uis.BackGround = GetPlotPlay_CardUis(ui:GetChild("BackGround"))
  uis.Card = GetPlotPlay_CardUis(ui:GetChild("Card"))
  uis.Talk = GetPlotPlay_TalkUis(ui:GetChild("Talk"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PartStart = GetPlotPlay_PartStartUis(ui:GetChild("PartStart"))
  uis.PlotEffect = GetPlotPlay_PlotEffectUis(ui:GetChild("PlotEffect"))
  uis.root = ui
  return uis
end
