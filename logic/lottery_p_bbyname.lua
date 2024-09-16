require("Lottery_P_TitleByName")

function GetLottery_P_BUis(ui)
  local uis = {}
  uis.P_Title = GetLottery_P_TitleUis(ui:GetChild("P_Title"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.root = ui
  return uis
end
