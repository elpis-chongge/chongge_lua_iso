require("CardAttribute_DetailsSkillIconByName")
require("CardAttribute_DetailsSkillInfoByName")
require("CardAttribute_DetailsSkillInfo2ByName")

function GetCardAttribute_DetailsSkillTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.DetailsSkillIcon = GetCardAttribute_DetailsSkillIconUis(ui:GetChild("DetailsSkillIcon"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.DetailsSkillInfo = GetCardAttribute_DetailsSkillInfoUis(ui:GetChild("DetailsSkillInfo"))
  uis.LeaderSkillInfo = GetCardAttribute_DetailsSkillInfo2Uis(ui:GetChild("LeaderSkillInfo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
