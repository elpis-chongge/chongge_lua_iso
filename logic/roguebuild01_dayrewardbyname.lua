require("RogueBuild01_DayRewardTimeByName")
require("RogueBuild01_DayRewardProgressByName")

function GetRogueBuild01_DayRewardUis(ui)
  local uis = {}
  uis.Number = GetRogueBuild01_DayRewardTimeUis(ui:GetChild("Number"))
  uis.ContentList = ui:GetChild("ContentList")
  uis.Progress = GetRogueBuild01_DayRewardProgressUis(ui:GetChild("Progress"))
  uis.root = ui
  return uis
end
