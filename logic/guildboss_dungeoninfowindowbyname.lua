require("GuildBoss_DungeonInfoByName")

function GetGuildBoss_DungeonInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_DungeonInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
