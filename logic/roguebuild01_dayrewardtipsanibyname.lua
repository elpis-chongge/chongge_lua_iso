require("RogueBuild01_DayRewardTipsByName")

function GetRogueBuild01_DayRewardTipsAniUis(ui)
  local uis = {}
  uis.DayRewardTips = GetRogueBuild01_DayRewardTipsUis(ui:GetChild("DayRewardTips"))
  uis.root = ui
  return uis
end
