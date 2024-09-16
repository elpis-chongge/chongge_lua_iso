require("Sign_Mudule1ColorTipsByName")
require("Sign_Mudule1GreenTipsByName")

function GetSign_Module1InfoUis(ui)
  local uis = {}
  uis.ColorTips = GetSign_Mudule1ColorTipsUis(ui:GetChild("ColorTips"))
  uis.GreenTips = GetSign_Mudule1GreenTipsUis(ui:GetChild("GreenTips"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
