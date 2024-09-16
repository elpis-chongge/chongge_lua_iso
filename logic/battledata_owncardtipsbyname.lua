require("CommonResource_OccupationByName")
require("BattleData_DamageByName")
require("BattleData_SufferDamageByName")
require("BattleData_CureByName")
require("BattleData_SufferCureByName")

function GetBattleData_OwnCardTipsUis(ui)
  local uis = {}
  uis.HeadBtn = ui:GetChild("HeadBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.TipsList = ui:GetChild("TipsList")
  uis.DamageProgressBar = GetBattleData_DamageUis(ui:GetChild("DamageProgressBar"))
  uis.SufferDamage = GetBattleData_SufferDamageUis(ui:GetChild("SufferDamage"))
  uis.Cure = GetBattleData_CureUis(ui:GetChild("Cure"))
  uis.SufferCure = GetBattleData_SufferCureUis(ui:GetChild("SufferCure"))
  uis.root = ui
  return uis
end
