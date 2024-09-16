require("CommonResource_PopupBgByName")
require("Message_MapContentByName")

function GetMessage_MapTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.MapContent = GetMessage_MapContentUis(ui:GetChild("MapContent"))
  uis.root = ui
  return uis
end
