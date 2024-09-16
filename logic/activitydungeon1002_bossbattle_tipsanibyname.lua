require("ActivityDungeon1002_BossBattle_TipsByName")

function GetActivityDungeon1002_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1002_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
