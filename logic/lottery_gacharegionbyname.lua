require("Lottery_Word1TipsByName")
require("Lottery_GaChaCountByName")
require("Lottery_Word2TipsByName")
require("CommonResource_LotteryFreeTimeByName")

function GetLottery_GaChaRegionUis(ui)
  local uis = {}
  uis.Word1Tips = GetLottery_Word1TipsUis(ui:GetChild("Word1Tips"))
  uis.GaChaCount = GetLottery_GaChaCountUis(ui:GetChild("GaChaCount"))
  uis.EveryDayBtn = ui:GetChild("EveryDayBtn")
  uis.Time1Btn = ui:GetChild("Time1Btn")
  uis.Times10Btn = ui:GetChild("Times10Btn")
  uis.NoviceGaChaBtn = ui:GetChild("NoviceGaChaBtn")
  uis.NoviceGaChaChoiceBtn = ui:GetChild("NoviceGaChaChoiceBtn")
  uis.Word2Tips = GetLottery_Word2TipsUis(ui:GetChild("Word2Tips"))
  uis.LotteryFreeTime1 = GetCommonResource_LotteryFreeTimeUis(ui:GetChild("LotteryFreeTime1"))
  uis.LotteryFreeTime2 = GetCommonResource_LotteryFreeTimeUis(ui:GetChild("LotteryFreeTime2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.LotteryFreeTime1Ctr = ui:GetController("LotteryFreeTime1")
  uis.LotteryFreeTime2Ctr = ui:GetController("LotteryFreeTime2")
  uis.root = ui
  return uis
end
