require("GuildBoss_GuildCardAssistTipsByName")
require("GuildBoss_GuildCardAssistNumberByName")

function GetGuildBoss_GuildCardAssistTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetGuildBoss_GuildCardAssistTipsUis(ui:GetChild("Tips"))
  uis.Number = GetGuildBoss_GuildCardAssistNumberUis(ui:GetChild("Number"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
