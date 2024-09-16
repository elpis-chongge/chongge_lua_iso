require("Message_ItemLabelWordByName")
require("Message_GetStripLockByName")

function GetMessage_GetStripBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemLabelWord = GetMessage_ItemLabelWordUis(ui:GetChild("ItemLabelWord"))
  uis.GetStripLock = GetMessage_GetStripLockUis(ui:GetChild("GetStripLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
