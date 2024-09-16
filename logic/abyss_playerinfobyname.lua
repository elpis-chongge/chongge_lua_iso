require("Abyss_DayByName")

function GetAbyss_PlayerInfoUis(ui)
  local uis = {}
  uis.Day = GetAbyss_DayUis(ui:GetChild("Day"))
  uis.BatteryProgressBar = ui:GetChild("BatteryProgressBar")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.IdNumberTxt = ui:GetChild("IdNumberTxt")
  uis.PlayerNameTxt = ui:GetChild("PlayerNameTxt")
  uis.root = ui
  return uis
end
