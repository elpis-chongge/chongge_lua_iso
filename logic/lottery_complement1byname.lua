require("Lottery_ComplementItemRegionByName")

function GetLottery_Complement1Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemRegion = GetLottery_ComplementItemRegionUis(ui:GetChild("ItemRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.root = ui
  return uis
end
