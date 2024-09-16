require("CommonResource_PopupBgByName")
require("Message_AssetsTipsGroupByName")
require("ShopTips_ExplainTitleByName")
require("ShopTips_ExplainStar1ByName")
require("ShopTips_ExplainStar2ByName")
require("ShopTips_ExplainStar3ByName")
require("ShopTips_ExplainStar4ByName")
require("ShopTips_ExplainStar5ByName")
require("ShopTips_ExplainWordByName")

function GetShopTips_TokenExplainUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.AssetsTipsGroup = GetMessage_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.ExplainTitle = GetShopTips_ExplainTitleUis(ui:GetChild("ExplainTitle"))
  uis.ExplainStar1 = GetShopTips_ExplainStar1Uis(ui:GetChild("ExplainStar1"))
  uis.ExplainStar2 = GetShopTips_ExplainStar2Uis(ui:GetChild("ExplainStar2"))
  uis.ExplainStar3 = GetShopTips_ExplainStar3Uis(ui:GetChild("ExplainStar3"))
  uis.ExplainStar4 = GetShopTips_ExplainStar4Uis(ui:GetChild("ExplainStar4"))
  uis.ExplainStar5 = GetShopTips_ExplainStar5Uis(ui:GetChild("ExplainStar5"))
  uis.ExplainWord1 = GetShopTips_ExplainWordUis(ui:GetChild("ExplainWord1"))
  uis.ExplainWord2 = GetShopTips_ExplainWordUis(ui:GetChild("ExplainWord2"))
  uis.root = ui
  return uis
end
