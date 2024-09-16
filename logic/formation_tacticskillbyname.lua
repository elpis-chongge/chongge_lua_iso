require("Formation_TacticSkillEffectRegionByName")
require("Formation_TacticSkillRegionByName")
require("Formation_TacticSkillLevelByName")
require("Formation_TacticSkillLockByName")

function GetFormation_TacticSkillUis(ui)
  local uis = {}
  uis.EffectRegion = GetFormation_TacticSkillEffectRegionUis(ui:GetChild("EffectRegion"))
  uis.ProgrammeList = ui:GetChild("ProgrammeList")
  uis.SkillRegion = GetFormation_TacticSkillRegionUis(ui:GetChild("SkillRegion"))
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Level = GetFormation_TacticSkillLevelUis(ui:GetChild("Level"))
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.NumberList = ui:GetChild("NumberList")
  uis.WordList = ui:GetChild("WordList")
  uis.WearBtn = ui:GetChild("WearBtn")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.Lock = GetFormation_TacticSkillLockUis(ui:GetChild("Lock"))
  uis.lcokCtr = ui:GetController("lcok")
  uis.maxCtr = ui:GetController("max")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
