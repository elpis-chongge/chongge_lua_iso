require("PlotDungeon_PlotRewardLockByName")
require("PlotDungeon_PlotRewardCompleteByName")

function GetPlotDungeon_PlotRewardTipsUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RewardTxt = ui:GetChild("RewardTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Lock = GetPlotDungeon_PlotRewardLockUis(ui:GetChild("Lock"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Complete = GetPlotDungeon_PlotRewardCompleteUis(ui:GetChild("Complete"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
