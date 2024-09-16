require("LotteryCardShow_ContentTipsHeadByName")

function GetLotteryCardShow_ContentTipsUis(ui)
  local uis = {}
  uis.HeadLoader = GetLotteryCardShow_ContentTipsHeadUis(ui:GetChild("HeadLoader"))
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
