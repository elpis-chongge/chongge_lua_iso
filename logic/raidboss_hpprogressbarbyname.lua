require("RaidBoss_HPProgressFillByName")

function GetRaidBoss_HPProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRaidBoss_HPProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
