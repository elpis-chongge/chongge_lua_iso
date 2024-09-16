require("Passport_BuyLevelDes2ByName")

function GetPassport_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetPassport_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
