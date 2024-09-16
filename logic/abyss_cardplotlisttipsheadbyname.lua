require("Abyss_CardPlotListTipsHeadBgByName")

function GetAbyss_CardPlotListTipsHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetAbyss_CardPlotListTipsHeadBgUis(ui:GetChild("HeadBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
