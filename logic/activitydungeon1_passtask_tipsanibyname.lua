require("ActivityDungeon1_PassTask_TipsByName")

function GetActivityDungeon1_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
