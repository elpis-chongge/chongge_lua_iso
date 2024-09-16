require("CommonResource_PopupBgByName")
require("MonthlyPass_Circle2ByName")
require("MonthlyPass_Circle1ByName")
require("MonthlyPass_MonthByName")

function GetMonthlyPass_MonthGetUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Circle2 = GetMonthlyPass_Circle2Uis(ui:GetChild("Circle2"))
  uis.Circle1 = GetMonthlyPass_Circle1Uis(ui:GetChild("Circle1"))
  uis.Month = GetMonthlyPass_MonthUis(ui:GetChild("Month"))
  uis.PressHolder = ui:GetChild("PressHolder")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
