require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("GuildBoss_RecommendCurrency1ByName")

function GetGuildBoss_RecommendCurrency2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Currency1 = GetGuildBoss_RecommendCurrency1Uis(ui:GetChild("Currency1"))
  uis.root = ui
  return uis
end
