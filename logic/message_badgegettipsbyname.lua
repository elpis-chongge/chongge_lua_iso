require("CommonResource_PopupBgByName")
require("Message_BadgeGetWayByName")
require("Message_BadgeGetTipsNumberByName")

function GetMessage_BadgeGetTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoaderr = ui:GetChild("PicLoaderr")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Way = GetMessage_BadgeGetWayUis(ui:GetChild("Way"))
  uis.ItemGetTipsNumber = GetMessage_BadgeGetTipsNumberUis(ui:GetChild("ItemGetTipsNumber"))
  uis.StarList = ui:GetChild("StarList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
