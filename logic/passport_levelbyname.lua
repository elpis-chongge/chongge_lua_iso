require("Passport_WeekNumberByName")
require("Passport_FullLevelByName")

function GetPassport_LevelUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ExpNumberTxt = ui:GetChild("ExpNumberTxt")
  uis.WeekNumber = GetPassport_WeekNumberUis(ui:GetChild("WeekNumber"))
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.LevelBuyBtn = ui:GetChild("LevelBuyBtn")
  uis.FullLevel = GetPassport_FullLevelUis(ui:GetChild("FullLevel"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
