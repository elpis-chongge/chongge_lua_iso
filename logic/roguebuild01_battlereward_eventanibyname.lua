require("RogueBuild01_BattleReward_EventByName")

function GetRogueBuild01_BattleReward_EventAniUis(ui)
  local uis = {}
  uis.Event = GetRogueBuild01_BattleReward_EventUis(ui:GetChild("Event"))
  uis.root = ui
  return uis
end
