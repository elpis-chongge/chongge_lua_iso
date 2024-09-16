require("Guild_Guild_infoByName")
require("Guild_Captain_infoByName")
require("Guild_JoinCondition_infoByName")
require("Guild_Examine_infoByName")
require("Guild_Chat_infoByName")
require("Guild_GuildEmptyByName")

function GetGuild_GuildMainUis(ui)
  local uis = {}
  uis.Guild_info = GetGuild_Guild_infoUis(ui:GetChild("Guild_info"))
  uis.Captain_info = GetGuild_Captain_infoUis(ui:GetChild("Captain_info"))
  uis.JoinCondition_info = GetGuild_JoinCondition_infoUis(ui:GetChild("JoinCondition_info"))
  uis.Examine_info = GetGuild_Examine_infoUis(ui:GetChild("Examine_info"))
  uis.OutBtn = ui:GetChild("OutBtn")
  uis.Chat_info = GetGuild_Chat_infoUis(ui:GetChild("Chat_info"))
  uis.PlayerList = ui:GetChild("PlayerList")
  uis.GuildEmpty = GetGuild_GuildEmptyUis(ui:GetChild("GuildEmpty"))
  uis.DissolutionBtn = ui:GetChild("DissolutionBtn")
  uis.TrainBtn = ui:GetChild("TrainBtn")
  uis.SupplyBtn = ui:GetChild("SupplyBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.bossCtr = ui:GetController("boss")
  uis.root = ui
  return uis
end
