require("Lottery_PopupBgByName")
require("CommonResource_CurrencyReturnByName")

function GetLottery_ProbabilityUis(ui)
  local uis = {}
  uis.PopupBg = GetLottery_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ProbabilityList = ui:GetChild("ProbabilityList")
  uis.ProbabilityLookBtn = ui:GetChild("ProbabilityLookBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
