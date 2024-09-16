require("Lottery_BannerBtnBgByName")
require("CommonResource_RedDotByName")
require("CommonResource_LotteryFreeByName")

function GetLottery_BannerBtnUis(ui)
  local uis = {}
  uis.BannerLoader = ui:GetChild("BannerLoader")
  uis.BannerBtnBg = GetLottery_BannerBtnBgUis(ui:GetChild("BannerBtnBg"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.LotteryFree = GetCommonResource_LotteryFreeUis(ui:GetChild("LotteryFree"))
  uis.buttonCtr = ui:GetController("button")
  uis.LotteryFreeCtr = ui:GetController("LotteryFree")
  uis.root = ui
  return uis
end
