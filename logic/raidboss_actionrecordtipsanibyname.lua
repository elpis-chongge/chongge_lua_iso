require("RaidBoss_ActionRecordTipsByName")

function GetRaidBoss_ActionRecordTipsAniUis(ui)
  local uis = {}
  uis.ActionRecordTips = GetRaidBoss_ActionRecordTipsUis(ui:GetChild("ActionRecordTips"))
  uis.root = ui
  return uis
end
