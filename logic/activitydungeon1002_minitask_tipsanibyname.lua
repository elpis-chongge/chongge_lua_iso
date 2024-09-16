require("ActivityDungeon1002_MiniTask_TipsByName")

function GetActivityDungeon1002_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1002_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
