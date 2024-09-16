require("CommonResource_PopupBgByName")
require("Message_SkillTips1ByName")

function GetMessage_SkillTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.SkillTips1 = GetMessage_SkillTips1Uis(ui:GetChild("SkillTips1"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
