require("GuildTrain_CardHeadByName")

function GetGuildTrain_CardHeadTipsBtnUis(ui)
  local uis = {}
  uis.CardHead = GetGuildTrain_CardHeadUis(ui:GetChild("CardHead"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.DamageProgressBar = ui:GetChild("DamageProgressBar")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
