require("PlotDungeon_EffectHolderByName")

function GetPlotDungeon_PlotInfoBtnAniUis(ui)
  local uis = {}
  uis.EffectHolder = GetPlotDungeon_EffectHolderUis(ui:GetChild("EffectHolder"))
  uis.PlotInfoBtn = ui:GetChild("PlotInfoBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
