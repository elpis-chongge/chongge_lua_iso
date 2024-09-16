require("Card_CardSkillUpEffectByName")
require("Card_CardSkillTipsByName")

function GetCard_CardSkillUpUis(ui)
  local uis = {}
  uis.Effect = GetCard_CardSkillUpEffectUis(ui:GetChild("Effect"))
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.CardSkillTips = GetCard_CardSkillTipsUis(ui:GetChild("CardSkillTips"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
