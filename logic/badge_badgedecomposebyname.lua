require("CommonResource_BackGroundByName")
require("Badge_DecomposeInfoByName")
require("Badge_DecomposeListByName")
require("CommonResource_CurrencyReturnByName")

function GetBadge_BadgeDecomposeUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.DecomposeInfo = GetBadge_DecomposeInfoUis(ui:GetChild("DecomposeInfo"))
  uis.DecomposeList = GetBadge_DecomposeListUis(ui:GetChild("DecomposeList"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
