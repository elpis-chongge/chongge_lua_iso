require("Abyss_CardPlotListTitleName1ByName")
require("Abyss_CardPlotListTitleName2ByName")
require("Abyss_CardPlotListTitleName4ByName")

function GetAbyss_CardPlotListTitleUis(ui)
  local uis = {}
  uis.Title = GetAbyss_CardPlotListTitleName1Uis(ui:GetChild("Title"))
  uis.Name = GetAbyss_CardPlotListTitleName2Uis(ui:GetChild("Name"))
  uis.CardName = GetAbyss_CardPlotListTitleName4Uis(ui:GetChild("CardName"))
  uis.ChapterList = ui:GetChild("ChapterList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
