require("Guild_GuildListByName")

function GetGuild_GuildListWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_GuildListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
