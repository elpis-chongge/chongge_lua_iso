require("Explore_AFKCountdownTimeByName")

function GetExplore_AFKCountdownUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Time = GetExplore_AFKCountdownTimeUis(ui:GetChild("Time"))
  uis.CountdownProgressBar = ui:GetChild("CountdownProgressBar")
  uis.WordTipsTxt = ui:GetChild("WordTipsTxt")
  uis.root = ui
  return uis
end
