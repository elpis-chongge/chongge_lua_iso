require("ActivityDungeon1_BossBattle_TipsByName")

function GetActivityDungeon1_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
