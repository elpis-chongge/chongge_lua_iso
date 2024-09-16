require("CommonResource_BackGroundByName")
require("Guild_GuildApplyByName")
require("CommonResource_CurrencyReturnByName")

function GetGuild_GuildListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.GuildApply = GetGuild_GuildApplyUis(ui:GetChild("GuildApply"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
