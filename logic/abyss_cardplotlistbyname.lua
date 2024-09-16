require("CommonResource_BackGroundByName")
require("Abyss_CardPlotListRegionByName")
require("Abyss_CardPlotDetailsByName")
require("CommonResource_CurrencyReturnByName")

function GetAbyss_CardPlotListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardPlotListRegion = GetAbyss_CardPlotListRegionUis(ui:GetChild("CardPlotListRegion"))
  uis.CardPlotDetails = GetAbyss_CardPlotDetailsUis(ui:GetChild("CardPlotDetails"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
