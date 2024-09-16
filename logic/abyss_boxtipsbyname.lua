require("Abyss_BoxTipsResetByName")
require("Abyss_BoxTipsInfo1ByName")
require("Abyss_BoxTipsInfo2ByName")
require("Abyss_BoxTipsInfo3ByName")
require("Abyss_BoxTipsLockByName")

function GetAbyss_BoxTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.Reset = GetAbyss_BoxTipsResetUis(ui:GetChild("Reset"))
  uis.Info1 = GetAbyss_BoxTipsInfo1Uis(ui:GetChild("Info1"))
  uis.Info2 = GetAbyss_BoxTipsInfo2Uis(ui:GetChild("Info2"))
  uis.Info3 = GetAbyss_BoxTipsInfo3Uis(ui:GetChild("Info3"))
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.Lock = GetAbyss_BoxTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
