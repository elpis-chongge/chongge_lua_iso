require("ActivityDungeon1001_Passport_ExpProgressFillByName")

function GetActivityDungeon1001_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1001_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
