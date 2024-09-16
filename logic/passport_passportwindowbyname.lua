require("Passport_PassportByName")

function GetPassport_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetPassport_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
