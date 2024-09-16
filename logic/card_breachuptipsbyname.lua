require("CommonResource_BackGroundByName")
require("Card_CardShowByName")
require("Card_EffectBreachByName")

function GetCard_BreachUpTipsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetCard_CardShowUis(ui:GetChild("CardShow"))
  uis.BackGroundHolder = ui:GetChild("BackGroundHolder")
  uis.EffectBreach = GetCard_EffectBreachUis(ui:GetChild("EffectBreach"))
  uis.InfoList = ui:GetChild("InfoList")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
