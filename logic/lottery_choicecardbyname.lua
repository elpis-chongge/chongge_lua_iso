require("Lottery_ChoiceNumberAniByName")

function GetLottery_ChoiceCardUis(ui)
  local uis = {}
  uis.ChoiceNumberAni = GetLottery_ChoiceNumberAniUis(ui:GetChild("ChoiceNumberAni"))
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
