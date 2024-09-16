require("CommonResource_BackGroundByName")
require("Card_CardShowByName")
require("Card_SkillInfoAniByName")

function GetCard_StarUpTipsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetCard_CardShowUis(ui:GetChild("CardShow"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SkillInfoAni = GetCard_SkillInfoAniUis(ui:GetChild("SkillInfoAni"))
  uis.StarList = ui:GetChild("StarList")
  uis.root = ui
  return uis
end
