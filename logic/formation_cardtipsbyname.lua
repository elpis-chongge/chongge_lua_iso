require("CommonResource_PopupBgByName")
require("Formation_CardPicBgByName")
require("Formation_CardInfoByName")
require("Formation_CardSkillModuleByName")

function GetFormation_CardTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardPicBg = GetFormation_CardPicBgUis(ui:GetChild("CardPicBg"))
  uis.CardInfo = GetFormation_CardInfoUis(ui:GetChild("CardInfo"))
  uis.CardSkillModule = GetFormation_CardSkillModuleUis(ui:GetChild("CardSkillModule"))
  uis.WordList = ui:GetChild("WordList")
  uis.GoToBtn = ui:GetChild("GoToBtn")
  uis.AttributeBtn = ui:GetChild("AttributeBtn")
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.BadgeList = ui:GetChild("BadgeList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
