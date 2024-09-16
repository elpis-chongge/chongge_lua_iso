require("LotteryCardShow_PaintingShowByName")

function GetLotteryCardShow_PaintingShowWindowUis(ui)
  local uis = {}
  uis.Main = GetLotteryCardShow_PaintingShowUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
