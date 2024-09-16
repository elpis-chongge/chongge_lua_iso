require("Lottery_ResultByName")

function GetLottery_ResultWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_ResultUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
