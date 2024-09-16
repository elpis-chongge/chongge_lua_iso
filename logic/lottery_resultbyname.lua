require("CommonResource_BackGroundByName")
require("Lottery_CardShowComByName")

function GetLottery_ResultUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TipsList = ui:GetChild("TipsList")
  uis.CardShowCom = GetLottery_CardShowComUis(ui:GetChild("CardShowCom"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
