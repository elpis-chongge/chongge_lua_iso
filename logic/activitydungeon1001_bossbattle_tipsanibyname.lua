require("ActivityDungeon1001_BossBattle_TipsByName")

function GetActivityDungeon1001_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1001_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
