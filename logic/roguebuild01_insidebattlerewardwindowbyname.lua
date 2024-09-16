require("RogueBuild01_InsideBattleRewardByName")

function GetRogueBuild01_InsideBattleRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideBattleRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
