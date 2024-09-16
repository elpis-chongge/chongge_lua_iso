require("Abyss_CardPlotMainAssetsExplainByName")

function GetAbyss_CardPlotMainAssetsTipsUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Explain = GetAbyss_CardPlotMainAssetsExplainUis(ui:GetChild("Explain"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
