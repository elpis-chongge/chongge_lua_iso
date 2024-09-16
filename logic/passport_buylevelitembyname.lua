require("Passport_AllFrame_MByName")

function GetPassport_BuyLevelItemUis(ui)
  local uis = {}
  uis.AllFrame_M = GetPassport_AllFrame_MUis(ui:GetChild("AllFrame_M"))
  uis.root = ui
  return uis
end
