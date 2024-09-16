require("RaidBoss_ActionRecordByName")

function GetRaidBoss_ActionRecordWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_ActionRecordUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
