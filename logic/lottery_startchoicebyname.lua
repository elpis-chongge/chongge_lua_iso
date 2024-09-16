require("Lottery_PopupBgByName")
require("Lottery_StartChoice_WordByName")
require("Lottery_StartChoice_LockWordByName")

function GetLottery_StartChoiceUis(ui)
  local uis = {}
  uis.PopupBg = GetLottery_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Word = GetLottery_StartChoice_WordUis(ui:GetChild("Word"))
  uis.Lock = GetLottery_StartChoice_LockWordUis(ui:GetChild("Lock"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
