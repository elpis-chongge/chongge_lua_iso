require("CommonResource_BackGroundByName")
require("Clothes_CardShowByName")
require("Clothes_CardQBByName")
require("Clothes_ClothesCardInfoByName")
require("CommonResource_CurrencyReturnByName")

function GetClothes_ClothesDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetClothes_CardShowUis(ui:GetChild("CardShow"))
  uis.CardQB = GetClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.ClothesCardInfo = GetClothes_ClothesCardInfoUis(ui:GetChild("ClothesCardInfo"))
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.WordTxtTxt = ui:GetChild("WordTxtTxt")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
