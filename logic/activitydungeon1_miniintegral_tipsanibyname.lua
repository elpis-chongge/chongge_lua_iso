require("ActivityDungeon1_MiniIntegral_TipsByName")

function GetActivityDungeon1_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
