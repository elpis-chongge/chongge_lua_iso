require("CommonResource_BackGroundByName")
require("LotteryCardShow_OccupationByName")
require("LotteryCardShow_PicByName")
require("LotteryCardShow_CardTipsByName")
require("LotteryCardShow_DialogueByName")

function GetLotteryCardShow_PaintingShowUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Occupation = GetLotteryCardShow_OccupationUis(ui:GetChild("Occupation"))
  uis.Pic = GetLotteryCardShow_PicUis(ui:GetChild("Pic"))
  uis.CardTips = GetLotteryCardShow_CardTipsUis(ui:GetChild("CardTips"))
  uis.Dialogue = GetLotteryCardShow_DialogueUis(ui:GetChild("Dialogue"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
