require("Carnival_ActivityContentByName")
require("CommonResource_CurrencyReturnByName")

function GetCarnival_ActivityUis(ui)
  local uis = {}
  uis.ActivityContent = GetCarnival_ActivityContentUis(ui:GetChild("ActivityContent"))
  uis.ActivityBtnList = ui:GetChild("ActivityBtnList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
