require("Message_GiftTips2BgByName")
require("Message_GiftMonthTimeByName")

function GetMessage_GiftTips2Uis(ui)
  local uis = {}
  uis.Bg = GetMessage_GiftTips2BgUis(ui:GetChild("Bg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.GiftMonthTime = GetMessage_GiftMonthTimeUis(ui:GetChild("GiftMonthTime"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
