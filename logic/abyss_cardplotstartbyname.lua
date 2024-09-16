require("CommonResource_PopupBgByName")
require("Abyss_CardTitleShowByName")

function GetAbyss_CardPlotStartUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.CardTitleShow = GetAbyss_CardTitleShowUis(ui:GetChild("CardTitleShow"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
