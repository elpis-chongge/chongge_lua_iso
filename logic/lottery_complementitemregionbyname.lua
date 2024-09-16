require("Lottery_ComplementItemByName")

function GetLottery_ComplementItemRegionUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Item1 = GetLottery_ComplementItemUis(ui:GetChild("Item1"))
  uis.Item2 = GetLottery_ComplementItemUis(ui:GetChild("Item2"))
  uis.root = ui
  return uis
end
