require("CommonResource_BackGroundByName")
require("Formation_FormationGridByName")
require("Formation_GuildBossHPRegionByName")
require("Formation_ExpeditionWaveByName")
require("Formation_ChoiceByName")
require("Formation_BurstStripByName")
require("CommonResource_CurrencyReturnByName")
require("Formation_ScreenChoiceByName")

function GetFormation_FormationUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BackGround2 = GetCommonResource_BackGroundUis(ui:GetChild("BackGround2"))
  uis.FormationGrid = GetFormation_FormationGridUis(ui:GetChild("FormationGrid"))
  uis.FormationGrid2 = GetFormation_FormationGridUis(ui:GetChild("FormationGrid2"))
  uis.BackGroundUp = GetCommonResource_BackGroundUis(ui:GetChild("BackGroundUp"))
  uis.TacticSkillGoBtn = ui:GetChild("TacticSkillGoBtn")
  uis.OwnMapBtn = ui:GetChild("OwnMapBtn")
  uis.GuildBossHPRegion = GetFormation_GuildBossHPRegionUis(ui:GetChild("GuildBossHPRegion"))
  uis.ConquersBtn = ui:GetChild("ConquersBtn")
  uis.ExpeditionWave = GetFormation_ExpeditionWaveUis(ui:GetChild("ExpeditionWave"))
  uis.BuffTipsMainBtn = ui:GetChild("BuffTipsMainBtn")
  uis.StarConditionBtn = ui:GetChild("StarConditionBtn")
  uis.Choice = GetFormation_ChoiceUis(ui:GetChild("Choice"))
  uis.BattleBtn = ui:GetChild("BattleBtn")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.BurstStrip = GetFormation_BurstStripUis(ui:GetChild("BurstStrip"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.ScreenChoice = GetFormation_ScreenChoiceUis(ui:GetChild("ScreenChoice"))
  uis.WaveTransitionHolder = ui:GetChild("WaveTransitionHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
