require("Lottery_AssetsTipsGroupByName")
require("Lottery_GaChaRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetLottery_CardShowRegionUis(ui)
  local uis = {}
  uis.CardShowList = ui:GetChild("CardShowList")
  uis.AssetsTipsGroup = GetLottery_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.GaChaRegion = GetLottery_GaChaRegionUis(ui:GetChild("GaChaRegion"))
  uis.FunctionList = ui:GetChild("FunctionList")
  uis.BannerList = ui:GetChild("BannerList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
