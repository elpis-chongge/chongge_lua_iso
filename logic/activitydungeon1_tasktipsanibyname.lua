require("ActivityDungeon1_TaskTipsByName")

function GetActivityDungeon1_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
