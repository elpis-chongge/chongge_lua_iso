require("BattleData_AxisGuildSkillTypeByName")

function GetBattleData_AxisGuildSkillBtnUis(ui)
  local uis = {}
  uis.GuildSkill = GetBattleData_AxisGuildSkillTypeUis(ui:GetChild("GuildSkill"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
