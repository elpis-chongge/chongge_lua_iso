require("Message_ItemNumberStripRegionByName")
require("Message_ItemNumberStripByName")

function GetMessage_NumberModularUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.ItemNumberStrip = GetMessage_ItemNumberStripRegionUis(ui:GetChild("ItemNumberStrip"))
  uis.NumberStrip = GetMessage_ItemNumberStripUis(ui:GetChild("NumberStrip"))
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
