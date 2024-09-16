require("ActivityDungeon1001_MiniStart_EndRewardByName")

function GetActivityDungeon1001_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
