require("Badge_LevelUpTipsAni1ByName")
require("Badge_LevelUpTipsAni2ByName")
require("Badge_LevelAttribute1ByName")

function GetBadge_LevelUpTipsContentUis(ui)
  local uis = {}
  uis.TipsAni1 = GetBadge_LevelUpTipsAni1Uis(ui:GetChild("TipsAni1"))
  uis.TipsAni2 = GetBadge_LevelUpTipsAni2Uis(ui:GetChild("TipsAni2"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.LevelAttribute1 = GetBadge_LevelAttribute1Uis(ui:GetChild("LevelAttribute1"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
