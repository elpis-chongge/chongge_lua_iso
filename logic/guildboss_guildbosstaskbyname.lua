require("CommonResource_BackGroundByName")
require("GuildBoss_GuildBossTaskNumberByName")

function GetGuildBoss_GuildBossTaskUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TaskList = ui:GetChild("TaskList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Number = GetGuildBoss_GuildBossTaskNumberUis(ui:GetChild("Number"))
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
