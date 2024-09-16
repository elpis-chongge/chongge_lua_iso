require("Lottery_ProbabilityByName")

function GetLottery_ProbabilityWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_ProbabilityUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
