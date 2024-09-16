require("CommonResource_PopupBgByName")
require("Message_MonthByName")

function GetMessage_MonthGetUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Month = GetMessage_MonthUis(ui:GetChild("Month"))
  uis.root = ui
  return uis
end
