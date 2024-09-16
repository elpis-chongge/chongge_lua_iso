require("Formation_GuildBossHPProgressFillByName")

function GetFormation_GuildBossHPProgressBarUis(ui)
  local uis = {}
  uis.bar = GetFormation_GuildBossHPProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
