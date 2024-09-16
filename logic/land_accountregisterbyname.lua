require("Land_InputWordByName")

function GetLand_AccountRegisterUis(ui)
  local uis = {}
  uis.Account = GetLand_InputWordUis(ui:GetChild("Account"))
  uis.Password1 = GetLand_InputWordUis(ui:GetChild("Password1"))
  uis.Password2 = GetLand_InputWordUis(ui:GetChild("Password2"))
  uis.AgreeCheckBtn = ui:GetChild("AgreeCheckBtn")
  uis.AccountBtn = ui:GetChild("AccountBtn")
  uis.root = ui
  return uis
end
