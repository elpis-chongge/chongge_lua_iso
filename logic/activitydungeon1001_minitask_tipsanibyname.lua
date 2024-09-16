require("ActivityDungeon1001_MiniTask_TipsByName")

function GetActivityDungeon1001_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1001_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
