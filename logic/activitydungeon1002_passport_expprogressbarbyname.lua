require("ActivityDungeon1002_Passport_ExpProgressFillByName")

function GetActivityDungeon1002_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1002_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
