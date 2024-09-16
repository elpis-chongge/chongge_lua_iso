require("BattleData_GuildSkill_DamageByName")
require("BattleData_GuildSkill_CureByName")
require("BattleData_GuildSkill_ShieldByName")

function GetBattleData_GuildSkill_OwnSkillTipsUis(ui)
  local uis = {}
  uis.HeadBtn = ui:GetChild("HeadBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.TipsList = ui:GetChild("TipsList")
  uis.Damage = GetBattleData_GuildSkill_DamageUis(ui:GetChild("Damage"))
  uis.Cure = GetBattleData_GuildSkill_CureUis(ui:GetChild("Cure"))
  uis.Shield = GetBattleData_GuildSkill_ShieldUis(ui:GetChild("Shield"))
  uis.SkillWordTxt = ui:GetChild("SkillWordTxt")
  uis.root = ui
  return uis
end
