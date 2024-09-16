require("CommonResource_PopupBgByName")
require("Message_StarOneSkill1ByName")

function GetMessage_StarOneSkill2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.BadgeOneSkill1 = GetMessage_StarOneSkill1Uis(ui:GetChild("BadgeOneSkill1"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
