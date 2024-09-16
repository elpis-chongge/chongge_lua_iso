require("CommonResource_CurrencyIndex2ByName")

function GetCommonResource_CurrencyReturnUis(ui)
  local uis = {}
  uis.CurrencyIndex2 = GetCommonResource_CurrencyIndex2Uis(ui:GetChild("CurrencyIndex2"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionMainBtn = ui:GetChild("FunctionMainBtn")
  uis.FunctionJumpBtn = ui:GetChild("FunctionJumpBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
