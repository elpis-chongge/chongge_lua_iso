require("ActivityDungeon1001_PassTask_TipsByName")

function GetActivityDungeon1001_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1001_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
