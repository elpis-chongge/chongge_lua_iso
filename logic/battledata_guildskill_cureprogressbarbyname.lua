require("BattleData_GuildSkill_CureProgressFillByName")

function GetBattleData_GuildSkill_CureProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_GuildSkill_CureProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
