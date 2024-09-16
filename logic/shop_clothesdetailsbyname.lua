require("CommonResource_BackGroundByName")
require("Shop_CardShowByName")
require("Shop_CardQBByName")
require("Shop_ClothesCardInfoByName")
require("Shop_ClothesListByName")
require("Shop_AssetsTipsGroupByName")
require("CommonResource_CurrencyReturnByName")

function GetShop_ClothesDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetShop_CardShowUis(ui:GetChild("CardShow"))
  uis.CardQB = GetShop_CardQBUis(ui:GetChild("CardQB"))
  uis.ClothesCardInfo = GetShop_ClothesCardInfoUis(ui:GetChild("ClothesCardInfo"))
  uis.ClothesList = GetShop_ClothesListUis(ui:GetChild("ClothesList"))
  uis.AssetsTipsGroup = GetShop_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
