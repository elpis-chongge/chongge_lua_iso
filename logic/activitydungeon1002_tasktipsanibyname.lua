require("ActivityDungeon1002_TaskTipsByName")

function GetActivityDungeon1002_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1002_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
