require("ActivityDungeon1_MiniStart_EndRewardByName")

function GetActivityDungeon1_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
