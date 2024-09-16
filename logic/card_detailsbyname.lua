require("Card_OccupationByName")
require("Card_CardBreachByName")
require("Card_ExpByName")
require("Card_CardAttributeStripByName")
require("Card_CardNameByName")
require("Card_Label1ByName")

function GetCard_DetailsUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Occupation = GetCard_OccupationUis(ui:GetChild("Occupation"))
  uis.CardBreach = GetCard_CardBreachUis(ui:GetChild("CardBreach"))
  uis.Level = GetCard_ExpUis(ui:GetChild("Level"))
  uis.StarList = ui:GetChild("StarList")
  uis.ElementList = ui:GetChild("ElementList")
  uis.CardAttributeStrip = GetCard_CardAttributeStripUis(ui:GetChild("CardAttributeStrip"))
  uis.CardName = GetCard_CardNameUis(ui:GetChild("CardName"))
  uis.SkillList = ui:GetChild("SkillList")
  uis.LvUpBtn = ui:GetChild("LvUpBtn")
  uis.SkillUpBtn = ui:GetChild("SkillUpBtn")
  uis.StarUpBtn = ui:GetChild("StarUpBtn")
  uis.Label1 = GetCard_Label1Uis(ui:GetChild("Label1"))
  uis.root = ui
  return uis
end
