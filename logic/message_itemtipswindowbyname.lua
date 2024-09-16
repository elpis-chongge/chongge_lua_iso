require("CommonResource_PopupBgByName")
require("Message_ItemTipsByName")

function GetMessage_ItemTipsWindowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Main = GetMessage_ItemTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
