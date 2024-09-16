require("Abyss_CardPlotListTipsHeadByName")

function GetAbyss_CardPlotListTips1Uis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Head = GetAbyss_CardPlotListTipsHeadUis(ui:GetChild("Head"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
