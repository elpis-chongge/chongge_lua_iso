require("GuildTrain_DamageProgressFillByName")

function GetGuildTrain_DamageProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuildTrain_DamageProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
