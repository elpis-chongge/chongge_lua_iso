require("Message_WayByName")

function GetMessage_MainModularUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.InfoList = ui:GetChild("InfoList")
  uis.WordList = ui:GetChild("WordList")
  uis.Way = GetMessage_WayUis(ui:GetChild("Way"))
  uis.Popup_B_Green_Btn = ui:GetChild("Popup_B_Green_Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
