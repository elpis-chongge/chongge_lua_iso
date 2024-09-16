require("CommonResource_PopupBgByName")
require("Message_ItemGetWayByName")
require("Message_ItemGetTipsNumberByName")
require("Message_ItemGetTimeByName")

function GetMessage_ItemGetTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoaderr = ui:GetChild("PicLoaderr")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Way = GetMessage_ItemGetWayUis(ui:GetChild("Way"))
  uis.ItemGetTipsNumber = GetMessage_ItemGetTipsNumberUis(ui:GetChild("ItemGetTipsNumber"))
  uis.ItemGetTime = GetMessage_ItemGetTimeUis(ui:GetChild("ItemGetTime"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
