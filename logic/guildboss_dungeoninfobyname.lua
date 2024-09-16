require("GuildBoss_DungeonInfoTipsByName")

function GetGuildBoss_DungeonInfoUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.DungeonInfoTips = GetGuildBoss_DungeonInfoTipsUis(ui:GetChild("DungeonInfoTips"))
  uis.root = ui
  return uis
end
