require("Lottery_P_TitleByName")

function GetLottery_P_AUis(ui)
  local uis = {}
  uis.P_Title = GetLottery_P_TitleUis(ui:GetChild("P_Title"))
  uis.InfoList = ui:GetChild("InfoList")
  uis.root = ui
  return uis
end
