require("Battle_CardHeadBgByName")
require("Battle_CardSignByName")

function GetBattle_CardHeadUis(ui)
  local uis = {}
  uis.CardHeadBg = GetBattle_CardHeadBgUis(ui:GetChild("CardHeadBg"))
  uis.BurstCDProgressBar = ui:GetChild("BurstCDProgressBar")
  uis.CardSign = GetBattle_CardSignUis(ui:GetChild("CardSign"))
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.AngerProgressBar = ui:GetChild("AngerProgressBar")
  uis.DefenseProgressBar = ui:GetChild("DefenseProgressBar")
  uis.BuffList = ui:GetChild("BuffList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
