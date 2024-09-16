require("Lottery_ResultTipsEmpty0ByName")

function GetLottery_ResultTipsAniUis(ui)
  local uis = {}
  uis.ResultTipsEmpty0 = GetLottery_ResultTipsEmpty0Uis(ui:GetChild("ResultTipsEmpty0"))
  uis.root = ui
  return uis
end
