require("CommonResource_PopupBgByName")
require("Message_SweepTipsByName")

function GetMessage_SweepUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SweepTips = GetMessage_SweepTipsUis(ui:GetChild("SweepTips"))
  uis.root = ui
  return uis
end
