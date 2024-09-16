require("Lottery_PopupBgByName")
require("Lottery_E_TitleByName")
require("CommonResource_CurrencyReturnByName")

function GetLottery_ExchangeUis(ui)
  local uis = {}
  uis.PopupBg = GetLottery_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ExchangeList = ui:GetChild("ExchangeList")
  uis.E_Title = GetLottery_E_TitleUis(ui:GetChild("E_Title"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
