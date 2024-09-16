function GetDailyTask_DayRewardUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.DayRewardBtn = ui:GetChild("DayRewardBtn")
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.root = ui
  return uis
end
