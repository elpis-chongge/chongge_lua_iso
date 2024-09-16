require("ResDownload_PopupBgByName")
require("ResDownload_Popup_BByName")
require("ResDownload_Update1ByName")

function GetResDownload_Update2Uis(ui)
  local uis = {}
  uis.PopupBg = GetResDownload_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetResDownload_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Update1 = GetResDownload_Update1Uis(ui:GetChild("Update1"))
  uis.root = ui
  return uis
end
