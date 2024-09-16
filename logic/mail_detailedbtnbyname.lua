require("Mail_DetailedBtnBg1ByName")
require("Mail_DetailedBtnBgByName")
require("Mail_TimeByName")

function GetMail_DetailedBtnUis(ui)
  local uis = {}
  uis.DetailedBtnBg1 = GetMail_DetailedBtnBg1Uis(ui:GetChild("DetailedBtnBg1"))
  uis.DetailedBtnBg = GetMail_DetailedBtnBgUis(ui:GetChild("DetailedBtnBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SenderTxt = ui:GetChild("SenderTxt")
  uis.Time = GetMail_TimeUis(ui:GetChild("Time"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
