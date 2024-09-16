require("ActivityDungeon1001_Plot_TipsByName")

function GetActivityDungeon1001_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1001_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
