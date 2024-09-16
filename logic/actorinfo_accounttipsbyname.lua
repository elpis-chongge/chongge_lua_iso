require("ActorInfo_PasswordModificationByName")
require("ActorInfo_ReturnLoginByName")
require("ActorInfo_ConcealByName")

function GetActorInfo_AccountTipsUis(ui)
  local uis = {}
  uis.PasswordModification = GetActorInfo_PasswordModificationUis(ui:GetChild("PasswordModification"))
  uis.ReturnLogin = GetActorInfo_ReturnLoginUis(ui:GetChild("ReturnLogin"))
  uis.Conceal = GetActorInfo_ConcealUis(ui:GetChild("Conceal"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
