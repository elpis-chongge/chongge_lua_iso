require("CommonResource_PopupBgByName")
require("Notice_NoticeUIByName")

function GetNotice_NoticeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.NoticeUI = GetNotice_NoticeUIUis(ui:GetChild("NoticeUI"))
  uis.root = ui
  return uis
end
