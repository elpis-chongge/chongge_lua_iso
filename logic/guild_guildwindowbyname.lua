require("Guild_GuildByName")

function GetGuild_GuildWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_GuildUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
