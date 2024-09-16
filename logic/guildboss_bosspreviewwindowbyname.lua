require("GuildBoss_BossPreviewByName")

function GetGuildBoss_BossPreviewWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_BossPreviewUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
