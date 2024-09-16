require("CommonResource_HeadByName")
require("PlayerInfo_ChoiceHeadDetailsLockByName")
require("PlayerInfo_ChoiceHeadDetailsInUseByName")

function GetPlayerInfo_ChoiceHeadDetailsUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.Lock = GetPlayerInfo_ChoiceHeadDetailsLockUis(ui:GetChild("Lock"))
  uis.InUse = GetPlayerInfo_ChoiceHeadDetailsInUseUis(ui:GetChild("InUse"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.WordList = ui:GetChild("WordList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.leftCtr = ui:GetController("left")
  uis.rightCtr = ui:GetController("right")
  uis.root = ui
  return uis
end
