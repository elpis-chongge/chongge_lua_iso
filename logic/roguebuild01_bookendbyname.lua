require("CommonResource_BackGroundByName")
require("RogueBuild01_BookEndWordByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_BookEndUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Word = GetRogueBuild01_BookEndWordUis(ui:GetChild("Word"))
  uis.TabList = ui:GetChild("TabList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
