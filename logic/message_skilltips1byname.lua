require("CommonResource_SkillByName")
require("Message_SkillTypeByName")
require("Message_SkillTipsInfoByName")

function GetMessage_SkillTips1Uis(ui)
  local uis = {}
  uis.Sikll = GetCommonResource_SkillUis(ui:GetChild("Sikll"))
  uis.SkillType = GetMessage_SkillTypeUis(ui:GetChild("SkillType"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Info = GetMessage_SkillTipsInfoUis(ui:GetChild("Info"))
  uis.UnitList = ui:GetChild("UnitList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
