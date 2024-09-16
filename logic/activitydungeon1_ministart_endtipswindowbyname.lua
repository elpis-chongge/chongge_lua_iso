require("ActivityDungeon1_MiniStart_EndTipsByName")

function GetActivityDungeon1_MiniStart_EndTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniStart_EndTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
