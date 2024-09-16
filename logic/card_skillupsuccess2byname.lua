require("CommonResource_PopupBgByName")
require("Card_SkillUpSuccessBgByName")
require("Card_SkillUpSuccess1ByName")

function GetCard_SkillUpSuccess2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_S = GetCard_SkillUpSuccessBgUis(ui:GetChild("Popup_S"))
  uis.SkillUpSuccess1 = GetCard_SkillUpSuccess1Uis(ui:GetChild("SkillUpSuccess1"))
  uis.root = ui
  return uis
end
