require("Message_DetailsSkillIconByName")
require("Message_DetailsSkillInfoByName")
require("Message_DetailsSkillInfo2ByName")

function GetMessage_DetailsSkillTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.DetailsSkillIcon = GetMessage_DetailsSkillIconUis(ui:GetChild("DetailsSkillIcon"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.DetailsSkillInfo = GetMessage_DetailsSkillInfoUis(ui:GetChild("DetailsSkillInfo"))
  uis.LeaderSkillInfo = GetMessage_DetailsSkillInfo2Uis(ui:GetChild("LeaderSkillInfo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
