require("CommonResource_BackGroundByName")
require("GuildBoss_GuildRankTitleByName")
require("GuildBoss_GuildRankInfoByName")

function GetGuildBoss_GuildRankUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.Title = GetGuildBoss_GuildRankTitleUis(ui:GetChild("Title"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.CardTipsList = ui:GetChild("CardTipsList")
  uis.Info = GetGuildBoss_GuildRankInfoUis(ui:GetChild("Info"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
