require("DailyTask_ExpProgressFillByName")
require("DailyTask_DropByName")
require("DailyTask_ExpNumberByName")

function GetDailyTask_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetDailyTask_ExpProgressFillUis(ui:GetChild("bar"))
  uis.Drop1 = GetDailyTask_DropUis(ui:GetChild("Drop1"))
  uis.Drop2 = GetDailyTask_DropUis(ui:GetChild("Drop2"))
  uis.Drop3 = GetDailyTask_DropUis(ui:GetChild("Drop3"))
  uis.Drop4 = GetDailyTask_DropUis(ui:GetChild("Drop4"))
  uis.Drop5 = GetDailyTask_DropUis(ui:GetChild("Drop5"))
  uis.Number1 = GetDailyTask_ExpNumberUis(ui:GetChild("Number1"))
  uis.Number2 = GetDailyTask_ExpNumberUis(ui:GetChild("Number2"))
  uis.Number3 = GetDailyTask_ExpNumberUis(ui:GetChild("Number3"))
  uis.Number4 = GetDailyTask_ExpNumberUis(ui:GetChild("Number4"))
  uis.Number5 = GetDailyTask_ExpNumberUis(ui:GetChild("Number5"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
