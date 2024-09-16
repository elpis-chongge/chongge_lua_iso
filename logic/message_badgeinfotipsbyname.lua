require("CommonResource_PopupBgByName")
require("Message_BadgeInfoWayByName")
require("Message_BadgeInfoLockByName")

function GetMessage_BadgeInfoTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoaderr = ui:GetChild("PicLoaderr")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Way = GetMessage_BadgeInfoWayUis(ui:GetChild("Way"))
  uis.StarList = ui:GetChild("StarList")
  uis.Lock = GetMessage_BadgeInfoLockUis(ui:GetChild("Lock"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
