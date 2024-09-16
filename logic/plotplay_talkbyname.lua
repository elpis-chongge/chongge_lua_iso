require("PlotPlay_TalkWordByName")
require("PlotPlay_ExplainWordByName")
require("PlotPlay_NarratorWordByName")
require("PlotPlay_MiddleWordByName")
require("PlotPlay_OptionGroupByName")
require("PlotPlay_AutoGroupByName")

function GetPlotPlay_TalkUis(ui)
  local uis = {}
  uis.TalkWord = GetPlotPlay_TalkWordUis(ui:GetChild("TalkWord"))
  uis.ExplainWord = GetPlotPlay_ExplainWordUis(ui:GetChild("ExplainWord"))
  uis.NarratorWord = GetPlotPlay_NarratorWordUis(ui:GetChild("NarratorWord"))
  uis.MiddleWord = GetPlotPlay_MiddleWordUis(ui:GetChild("MiddleWord"))
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.AutoBtn = ui:GetChild("AutoBtn")
  uis.LookBackBtn = ui:GetChild("LookBackBtn")
  uis.HideBtn = ui:GetChild("HideBtn")
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.OptionGroup = GetPlotPlay_OptionGroupUis(ui:GetChild("OptionGroup"))
  uis.AutoGroup = GetPlotPlay_AutoGroupUis(ui:GetChild("AutoGroup"))
  uis.root = ui
  return uis
end
