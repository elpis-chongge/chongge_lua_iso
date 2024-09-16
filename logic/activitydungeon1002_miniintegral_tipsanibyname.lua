require("ActivityDungeon1002_MiniIntegral_TipsByName")

function GetActivityDungeon1002_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1002_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
