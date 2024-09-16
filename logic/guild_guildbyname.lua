require("CommonResource_BackGroundByName")
require("Guild_GuildMainByName")
require("CommonResource_CurrencyReturnByName")

function GetGuild_GuildUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.GuildMain = GetGuild_GuildMainUis(ui:GetChild("GuildMain"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
