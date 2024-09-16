require("CommonResource_BackGroundByName")
require("GuildBoss_BossBattleRoundByName")

function GetGuildBoss_BossBattleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.BossList = ui:GetChild("BossList")
  uis.Round = GetGuildBoss_BossBattleRoundUis(ui:GetChild("Round"))
  uis.root = ui
  return uis
end
