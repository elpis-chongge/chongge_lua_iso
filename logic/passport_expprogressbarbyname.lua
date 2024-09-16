require("Passport_ExpProgressFillByName")

function GetPassport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetPassport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
