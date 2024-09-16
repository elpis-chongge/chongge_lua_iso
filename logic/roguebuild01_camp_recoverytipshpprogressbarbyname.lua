require("RogueBuild01_Camp_RecoveryTipsHpProgressFillByName")

function GetRogueBuild01_Camp_RecoveryTipsHpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRogueBuild01_Camp_RecoveryTipsHpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
