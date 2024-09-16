require("ActivityDungeon1002_Plot_TipsByName")

function GetActivityDungeon1002_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1002_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
