require("RegressionSign_Mudule1ColorTipsByName")
require("RegressionSign_Mudule1GreenTipsByName")

function GetRegressionSign_Module1InfoUis(ui)
  local uis = {}
  uis.ColorTips = GetRegressionSign_Mudule1ColorTipsUis(ui:GetChild("ColorTips"))
  uis.GreenTips = GetRegressionSign_Mudule1GreenTipsUis(ui:GetChild("GreenTips"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
