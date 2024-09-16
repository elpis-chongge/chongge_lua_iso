require("Battle_BurstTimeByName")

function GetBattle_BurstBtnUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Effect3Holder = ui:GetChild("Effect3Holder")
  uis.Effect4Holder = ui:GetChild("Effect4Holder")
  uis.BurstTime = GetBattle_BurstTimeUis(ui:GetChild("BurstTime"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ProgressBarHolder = ui:GetChild("ProgressBarHolder")
  uis.ProgressBarDarkHolder = ui:GetChild("ProgressBarDarkHolder")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
