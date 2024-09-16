require("GuildBoss_GuildBossTaskProgressByName")
require("CommonResource_ItemFrameByName")
require("GuildBoss_GuildBossTaskCompleteByName")

function GetGuildBoss_GuildBossTaskTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TaskProgressBar = ui:GetChild("TaskProgressBar")
  uis.Progress = GetGuildBoss_GuildBossTaskProgressUis(ui:GetChild("Progress"))
  uis.WordList = ui:GetChild("WordList")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.Complete = GetGuildBoss_GuildBossTaskCompleteUis(ui:GetChild("Complete"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
