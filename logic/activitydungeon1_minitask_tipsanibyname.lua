require("ActivityDungeon1_MiniTask_TipsByName")

function GetActivityDungeon1_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
