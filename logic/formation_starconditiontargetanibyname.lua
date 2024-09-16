require("Formation_StarConditionTargetByName")

function GetFormation_StarConditionTargetAniUis(ui)
  local uis = {}
  uis.Target = GetFormation_StarConditionTargetUis(ui:GetChild("Target"))
  uis.root = ui
  return uis
end
