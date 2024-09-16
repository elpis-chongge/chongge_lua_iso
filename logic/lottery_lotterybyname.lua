require("CommonResource_BackGroundByName")
require("Lottery_CardShowRegionByName")

function GetLottery_LotteryUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShowRegion = GetLottery_CardShowRegionUis(ui:GetChild("CardShowRegion"))
  uis.root = ui
  return uis
end
