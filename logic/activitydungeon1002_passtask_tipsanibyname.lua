require("ActivityDungeon1002_PassTask_TipsByName")

function GetActivityDungeon1002_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1002_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
