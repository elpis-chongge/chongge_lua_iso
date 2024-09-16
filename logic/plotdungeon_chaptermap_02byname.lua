require("PlotDungeon_PlotInfoBtnAniByName")

function GetPlotDungeon_ChapterMap_02Uis(ui)
  local uis = {}
  uis.Q1 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q1"))
  uis.Q2 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q2"))
  uis.Q3 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q3"))
  uis.Q4 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q4"))
  uis.Q5 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q5"))
  uis.Q6 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q6"))
  uis.Q7 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q7"))
  uis.Q8 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q8"))
  uis.Q9 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q9"))
  uis.Q10 = GetPlotDungeon_PlotInfoBtnAniUis(ui:GetChild("Q10"))
  uis.root = ui
  return uis
end
