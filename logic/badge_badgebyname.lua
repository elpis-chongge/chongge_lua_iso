require("CommonResource_BackGroundByName")
require("Badge_CardShowByName")
require("Badge_EmptyEffectByName")
require("Badge_HomePageByName")
require("Badge_BadgeDetailsLevelUpByName")
require("CommonResource_CurrencyReturnByName")

function GetBadge_BadgeUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Shade1Holder = ui:GetChild("Shade1Holder")
  uis.CardShow = GetBadge_CardShowUis(ui:GetChild("CardShow"))
  uis.Shade2Holder = ui:GetChild("Shade2Holder")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.EffectHolder1 = ui:GetChild("EffectHolder1")
  uis.EffectDistortHolder = ui:GetChild("EffectDistortHolder")
  uis.EffectHolder2 = ui:GetChild("EffectHolder2")
  uis.EffectHolder3 = ui:GetChild("EffectHolder3")
  uis.EffectHolder4 = ui:GetChild("EffectHolder4")
  uis.EmptyEffect = GetBadge_EmptyEffectUis(ui:GetChild("EmptyEffect"))
  uis.HomePage = GetBadge_HomePageUis(ui:GetChild("HomePage"))
  uis.BadgeDetailsLevelUp = GetBadge_BadgeDetailsLevelUpUis(ui:GetChild("BadgeDetailsLevelUp"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.GuideBtn = ui:GetChild("GuideBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
