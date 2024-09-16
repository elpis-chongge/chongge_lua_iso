require("Guild_GuildTipsByName")

function GetGuild_GuildTipsAniUis(ui)
  local uis = {}
  uis.GuildTips = GetGuild_GuildTipsUis(ui:GetChild("GuildTips"))
  uis.root = ui
  return uis
end
