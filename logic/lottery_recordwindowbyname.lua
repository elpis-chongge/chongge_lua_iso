require("Lottery_RecordByName")

function GetLottery_RecordWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_RecordUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
