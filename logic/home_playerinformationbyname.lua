require("Home_DayByName")

function GetHome_PlayerInformationUis(ui)
  local uis = {}
  uis.Day = GetHome_DayUis(ui:GetChild("Day"))
  uis.IdNumberTxt = ui:GetChild("IdNumberTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.PlayerLevelTxt = ui:GetChild("PlayerLevelTxt")
  uis.PlayerNameTxt = ui:GetChild("PlayerNameTxt")
  uis.BatteryProgressBar = ui:GetChild("BatteryProgressBar")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.root = ui
  return uis
end
