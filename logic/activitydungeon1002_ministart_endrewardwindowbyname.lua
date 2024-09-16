require("ActivityDungeon1002_MiniStart_EndRewardByName")

function GetActivityDungeon1002_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
