require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_HandBookUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BookEndBtn = ui:GetChild("BookEndBtn")
  uis.BookEventBtn = ui:GetChild("BookEventBtn")
  uis.BookTreasureBtn = ui:GetChild("BookTreasureBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
