require("Land_AccountInputByName")
require("Land_AccountRegisterByName")

function GetLand_AccountUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.AccountInput = GetLand_AccountInputUis(ui:GetChild("AccountInput"))
  uis.AccountRegister = GetLand_AccountRegisterUis(ui:GetChild("AccountRegister"))
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
