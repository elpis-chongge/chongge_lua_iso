require("CommonResource_PopupBgByName")
require("Shop_MonthExplain1ByName")

function GetShop_MonthExplain2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.MonthExplain = GetShop_MonthExplain1Uis(ui:GetChild("MonthExplain"))
  uis.root = ui
  return uis
end
