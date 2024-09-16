require("Passport_BuyByName")

function GetPassport_BuyWindowUis(ui)
  local uis = {}
  uis.Main = GetPassport_BuyUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
