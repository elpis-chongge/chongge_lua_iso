require("InitialSign_SignItemByName")

function GetInitialSign_SignItemAniUis(ui)
  local uis = {}
  uis.SignItem = GetInitialSign_SignItemUis(ui:GetChild("SignItem"))
  uis.root = ui
  return uis
end
