require("CommonResource_BackGroundByName")
require("Abyss_CardPlotMainAssetsTipsByName")
require("CommonResource_CurrencyReturnByName")

function GetAbyss_CardPlotMainUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.AssetsTips = GetAbyss_CardPlotMainAssetsTipsUis(ui:GetChild("AssetsTips"))
  uis.Entry1Btn = ui:GetChild("Entry1Btn")
  uis.Entry2Btn = ui:GetChild("Entry2Btn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
