require("Message_StarOneSkillLockByName")

function GetMessage_StarOneSkill1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SkillLock = GetMessage_StarOneSkillLockUis(ui:GetChild("SkillLock"))
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
