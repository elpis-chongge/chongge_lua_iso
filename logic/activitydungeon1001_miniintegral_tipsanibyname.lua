require("ActivityDungeon1001_MiniIntegral_TipsByName")

function GetActivityDungeon1001_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1001_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
