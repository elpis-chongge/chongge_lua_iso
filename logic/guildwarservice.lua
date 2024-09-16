local GetGuildWarScheduleReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarScheduleReq, nil, rspCallback)
end
local GetGuildWarScheduleRsp = function(msg)
  GuildWarData.SetGuildScheduleInfo(msg.schedule)
end
local GetGuildWarAllInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarAllInfoReq, nil, rspCallback)
end
local GetGuildWarAllInfoRsp = function(msg)
  GuildWarData.SetGuildScheduleInfo(msg.schedule)
  GuildWarData.SetGuildWarProgressInfo(msg.progress)
  GuildWarData.SetGuildPlayerInfo(msg.actorGuildWar)
  GuildWarData.SetGuildTaskInfo(msg.tasks)
  UIMgr:SendWindowMessage(WinResConfig.GuildWarLevelSelectedWindow.name, WindowMsgEnum.GuildWar.RECV_GUILD_WAR_ALL_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD_WAR)
end
local GetGuildWarCompensateFormationReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarCompensateFormationReq, nil, rspCallback)
end
local GetGuildWarCompensateFormationRsp = function(msg)
  GuildWarData.SetCompensateFormations(msg.formations)
end
local LevelupGuildWarSkillReq = function(skillId, rspCallback)
  Net.Send(Proto.MsgName.LevelupGuildWarSkillReq, {skillId = skillId}, rspCallback)
end
local LevelupGuildWarSkillRsp = function(msg)
  GuildWarData.SetPlayerSkillLevel(msg.skillId, msg.level)
end
local SetGuildWarAssistCardReq = function(cardIds, rspCallback)
  Net.Send(Proto.MsgName.SetGuildWarAssistCardReq, {cardIds = cardIds}, rspCallback)
end
local SetGuildWarAssistCardRsp = function(msg)
  GuildWarData.SetPlayerAssistCard(msg.assistCardId2Count)
end
local GetGuildWarRecommendFormationReq = function(stageId, rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarRecommendFormationReq, {stageId = stageId}, rspCallback)
end
local GetGuildWarRecommendFormationRsp = function(msg)
  GuildWarData.SetRecommendFormations(msg.formations)
end
local GetGuildWarRankReq = function(index, rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarRankReq, {index = index}, rspCallback)
end
local GetGuildWarRankRsp = function(msg)
  GuildWarData.SetRankInfo(msg)
end
local RewardGuildWarTaskReq = function(taskUid, rspCallback)
  Net.Send(Proto.MsgName.RewardGuildWarTaskReq, {taskUid = taskUid}, rspCallback)
end
local RewardGuildWarTaskRsp = function(msg)
  GetItemTips.Show(msg.goods)
  GuildWarData.UpdateGuildTaskInfo(msg.task)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD_WAR)
end
local SetGuildWarSkillTeamReq = function(teamId, skillIds, used, rspCallback)
  local msg = {}
  msg.team = {
    teamId = teamId,
    skillIds = skillIds,
    used = used
  }
  Net.Send(Proto.MsgName.SetGuildWarSkillTeamReq, msg, rspCallback)
end
local SetGuildWarSkillTeamRsp = function(msg)
  GuildWarData.SetPlayerSkillTeam(msg.skillTeams)
end
local GetGuildWarBattleRecordReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarBattleRecordReq, {}, rspCallback)
end
local GetGuildWarBattleRecordRsp = function(msg)
  GuildWarData.SetBattleRecord(msg.records)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetGuildWarScheduleRsp, GetGuildWarScheduleRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarAllInfoRsp, GetGuildWarAllInfoRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarCompensateFormationRsp, GetGuildWarCompensateFormationRsp)
  Net.AddListener(Proto.MsgName.LevelupGuildWarSkillRsp, LevelupGuildWarSkillRsp)
  Net.AddListener(Proto.MsgName.SetGuildWarAssistCardRsp, SetGuildWarAssistCardRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarRecommendFormationRsp, GetGuildWarRecommendFormationRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarRankRsp, GetGuildWarRankRsp)
  Net.AddListener(Proto.MsgName.RewardGuildWarTaskRsp, RewardGuildWarTaskRsp)
  Net.AddListener(Proto.MsgName.SetGuildWarSkillTeamRsp, SetGuildWarSkillTeamRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarBattleRecordRsp, GetGuildWarBattleRecordRsp)
end
Init()
return {
  GetGuildWarScheduleReq = GetGuildWarScheduleReq,
  GetGuildWarAllInfoReq = GetGuildWarAllInfoReq,
  GetGuildWarCompensateFormationReq = GetGuildWarCompensateFormationReq,
  LevelupGuildWarSkillReq = LevelupGuildWarSkillReq,
  SetGuildWarAssistCardReq = SetGuildWarAssistCardReq,
  GetGuildWarRankReq = GetGuildWarRankReq,
  RewardGuildWarTaskReq = RewardGuildWarTaskReq,
  SetGuildWarSkillTeamReq = SetGuildWarSkillTeamReq,
  GetGuildWarBattleRecordReq = GetGuildWarBattleRecordReq,
  GetGuildWarRecommendFormationReq = GetGuildWarRecommendFormationReq
}
