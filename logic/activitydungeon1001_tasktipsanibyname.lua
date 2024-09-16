require("ActivityDungeon1001_TaskTipsByName")

function GetActivityDungeon1001_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1001_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
