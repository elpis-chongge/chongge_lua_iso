require("ActivityDungeon1_Plot_TipsByName")

function GetActivityDungeon1_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
