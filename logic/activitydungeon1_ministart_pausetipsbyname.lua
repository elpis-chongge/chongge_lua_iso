require("ActivityDungeon1_MiniStart_PauseTips1ByName")

function GetActivityDungeon1_MiniStart_PauseTipsUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1_MiniStart_PauseTips1Uis(ui:GetChild("Tips"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
