require("Sign_Mudule2ColorTipsByName")
require("Sign_Mudule2GreyTipsByName")

function GetSign_Module2InfoUis(ui)
  local uis = {}
  uis.ColorTips = GetSign_Mudule2ColorTipsUis(ui:GetChild("ColorTips"))
  uis.GreenTips = GetSign_Mudule2GreyTipsUis(ui:GetChild("GreenTips"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
