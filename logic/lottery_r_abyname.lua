require("Lottery_R_TitleByName")

function GetLottery_R_AUis(ui)
  local uis = {}
  uis.R_Title = GetLottery_R_TitleUis(ui:GetChild("R_Title"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.root = ui
  return uis
end
