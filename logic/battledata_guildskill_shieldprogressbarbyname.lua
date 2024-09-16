require("BattleData_GuildSkill_ShieldProgressFillByName")

function GetBattleData_GuildSkill_ShieldProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_GuildSkill_ShieldProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
