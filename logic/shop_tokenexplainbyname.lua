require("CommonResource_PopupBgByName")
require("Message_AssetsTipsGroupByName")
require("Shop_ExplainTitleByName")
require("Shop_ExplainStar1ByName")
require("Shop_ExplainStar2ByName")
require("Shop_ExplainStar3ByName")
require("Shop_ExplainStar4ByName")
require("Shop_ExplainStar5ByName")
require("Shop_ExplainWordByName")

function GetShop_TokenExplainUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.AssetsTipsGroup = GetMessage_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.ExplainTitle = GetShop_ExplainTitleUis(ui:GetChild("ExplainTitle"))
  uis.ExplainStar1 = GetShop_ExplainStar1Uis(ui:GetChild("ExplainStar1"))
  uis.ExplainStar2 = GetShop_ExplainStar2Uis(ui:GetChild("ExplainStar2"))
  uis.ExplainStar3 = GetShop_ExplainStar3Uis(ui:GetChild("ExplainStar3"))
  uis.ExplainStar4 = GetShop_ExplainStar4Uis(ui:GetChild("ExplainStar4"))
  uis.ExplainStar5 = GetShop_ExplainStar5Uis(ui:GetChild("ExplainStar5"))
  uis.ExplainWord1 = GetShop_ExplainWordUis(ui:GetChild("ExplainWord1"))
  uis.ExplainWord2 = GetShop_ExplainWordUis(ui:GetChild("ExplainWord2"))
  uis.root = ui
  return uis
end
