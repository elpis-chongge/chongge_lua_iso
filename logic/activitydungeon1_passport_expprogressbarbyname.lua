require("ActivityDungeon1_Passport_ExpProgressFillByName")

function GetActivityDungeon1_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
