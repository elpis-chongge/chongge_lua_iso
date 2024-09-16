require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetGuildSupply_GuildSupplyUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
