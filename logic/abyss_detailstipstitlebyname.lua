require("Abyss_CardPlotListTipsHeadByName")
require("Abyss_CardPlotProgressByName")

function GetAbyss_DetailsTipsTitleUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.Head = GetAbyss_CardPlotListTipsHeadUis(ui:GetChild("Head"))
  uis.Progress = GetAbyss_CardPlotProgressUis(ui:GetChild("Progress"))
  uis.ScheduleList = ui:GetChild("ScheduleList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
