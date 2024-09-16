require("CommonResource_BackGroundByName")
require("Card_OccupationByName")
require("Card_CardBreachUpBackByName")
require("Card_CardSkillUpBackByName")
require("Card_CardShowListAniByName")
require("Card_DetailsByName")
require("Card_CardLevelUpByName")
require("Card_CardSkillUpByName")
require("Card_CardStarUpByName")
require("Card_CardStoryByName")
require("Card_CardClothesByName")
require("Card_CardBreachUpByName")
require("CommonResource_CurrencyReturnByName")

function GetCard_CardDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Occupation = GetCard_OccupationUis(ui:GetChild("Occupation"))
  uis.CardBreachUpBack = GetCard_CardBreachUpBackUis(ui:GetChild("CardBreachUpBack"))
  uis.CardSkillUpBack = GetCard_CardSkillUpBackUis(ui:GetChild("CardSkillUpBack"))
  uis.CardShow = GetCard_CardShowListAniUis(ui:GetChild("CardShow"))
  uis.Details = GetCard_DetailsUis(ui:GetChild("Details"))
  uis.CardLevelUp = GetCard_CardLevelUpUis(ui:GetChild("CardLevelUp"))
  uis.CardSkillUp = GetCard_CardSkillUpUis(ui:GetChild("CardSkillUp"))
  uis.CardStarUp = GetCard_CardStarUpUis(ui:GetChild("CardStarUp"))
  uis.CardStory = GetCard_CardStoryUis(ui:GetChild("CardStory"))
  uis.CardClothes = GetCard_CardClothesUis(ui:GetChild("CardClothes"))
  uis.CardBreachUp = GetCard_CardBreachUpUis(ui:GetChild("CardBreachUp"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
