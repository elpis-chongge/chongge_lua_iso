require("Card_SkillLockByName")
require("Card_SkillMaxByName")
require("Card_SkillWordNextByName")
require("Card_SkillCDInfoByName")

function GetCard_SkillTipsRegionUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TypeTxt = ui:GetChild("TypeTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.NextBtn = ui:GetChild("NextBtn")
  uis.StarList = ui:GetChild("StarList")
  uis.SkillUpSureBtn = ui:GetChild("SkillUpSureBtn")
  uis.SkillLock = GetCard_SkillLockUis(ui:GetChild("SkillLock"))
  uis.SkillMax = GetCard_SkillMaxUis(ui:GetChild("SkillMax"))
  uis.SkillWordNext = GetCard_SkillWordNextUis(ui:GetChild("SkillWordNext"))
  uis.SkillCD = GetCard_SkillCDInfoUis(ui:GetChild("SkillCD"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
