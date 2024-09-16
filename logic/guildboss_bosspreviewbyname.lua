require("CommonResource_BackGroundByName")
require("GuildBoss_BossPreviewTimeByName")

function GetGuildBoss_BossPreviewUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Time = GetGuildBoss_BossPreviewTimeUis(ui:GetChild("Time"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
