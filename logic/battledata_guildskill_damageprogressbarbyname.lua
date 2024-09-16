require("BattleData_GuildSkill_DamageProgressFillByName")

function GetBattleData_GuildSkill_DamageProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_GuildSkill_DamageProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
