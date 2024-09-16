require("Lottery_PopupBgByName")
require("CommonResource_CurrencyReturnByName")

function GetLottery_RecordUis(ui)
  local uis = {}
  uis.PopupBg = GetLottery_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.RecordList = ui:GetChild("RecordList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
