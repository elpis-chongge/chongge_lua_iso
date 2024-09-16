require("Land_InputWordByName")

function GetLand_AccountInputUis(ui)
  local uis = {}
  uis.Account = GetLand_InputWordUis(ui:GetChild("Account"))
  uis.Password1 = GetLand_InputWordUis(ui:GetChild("Password1"))
  uis.AccountBtn = ui:GetChild("AccountBtn")
  uis.root = ui
  return uis
end
