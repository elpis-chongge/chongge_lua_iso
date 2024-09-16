require("CommonResource_BackGroundByName")
require("CardPreview_CardShowByName")
require("CardPreview_CardNameByName")
require("CardPreview_Info_1ByName")
require("CardPreview_Info_2ByName")
require("CardPreview_Info_3ByName")
require("CommonResource_CurrencyReturnByName")

function GetCardPreview_CardPreviewUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetCardPreview_CardShowUis(ui:GetChild("CardShow"))
  uis.CardName = GetCardPreview_CardNameUis(ui:GetChild("CardName"))
  uis.Info_1 = GetCardPreview_Info_1Uis(ui:GetChild("Info_1"))
  uis.Info_2 = GetCardPreview_Info_2Uis(ui:GetChild("Info_2"))
  uis.Info_3 = GetCardPreview_Info_3Uis(ui:GetChild("Info_3"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
