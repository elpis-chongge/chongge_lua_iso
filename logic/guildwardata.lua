local scheduleInfo, progressInfo, playerInfo, guildWarConfig, warRankInfo, taskInfo, battleRecord
local cachedBattleDetailRecord = {}
local challengeStageRsp
local SetGuildScheduleInfo = function(info)
  scheduleInfo = info
  if info then
    local guildData = TableData.GetTable("BaseGuildWar")
    for i, v in pairs(guildData) do
      if v.phase == info.phase then
        guildWarConfig = v
        break
      end
    end
  end
end
local GetGuildScheduleInfo = function()
  return scheduleInfo
end
local GetGuildWarConfig = function()
  return guildWarConfig
end
local SetGuildWarProgressInfo = function(info)
  progressInfo = info
end
local GetGuildWarProgressInfo = function()
  return progressInfo
end
local SetGuildPlayerInfo = function(info)
  playerInfo = info
end
local GetGuildPlayerInfo = function()
  return playerInfo
end
local GetSkillTeamByTeamId = function(teamId)
  if playerInfo then
    for i, v in pairs(playerInfo.skillTeams) do
      if v.teamId == teamId then
        return v
      end
    end
  end
end
local SetPlayerSkillLevel = function(skillId, level)
  if playerInfo then
    playerInfo.skill2Level[skillId] = level
  end
end
local SetPlayerSkillTeam = function(skillTeam)
  if playerInfo and skillTeam then
    playerInfo.skillTeams = skillTeam
  end
end
local SetPlayerAssistCard = function(assistCardId2Count)
  if playerInfo then
    playerInfo.assistCardId2Count = assistCardId2Count
  end
end
local compensateFormations
local SetCompensateFormations = function(formations)
  compensateFormations = formations
end
local GetCompensateFormations = function()
  return compensateFormations
end
local recommendFormations
local SetRecommendFormations = function(formations)
  if formations then
    for _, formation in ipairs(formations) do
      if 1 ~= formation.version then
        local stageConfig = TableData.GetConfig(formation.stageId, "BaseStage")
        local shareCount = stageConfig.share_hp_count
        if shareCount and shareCount > 0 then
          formation.damageHp = math.ceil(formation.damageHp / shareCount)
        end
      end
    end
  end
  recommendFormations = formations
end
local GetRecommendFormations = function()
  return recommendFormations
end
local SetRankInfo = function(rankInfo)
  warRankInfo = rankInfo
end
local GetRankInfo = function()
  return warRankInfo
end
local SetCachedBattleDetailRecord = function(msg)
  msg.record.battleData = Net.DecodePb("BattleCompleteData", msg.record.data)
  cachedBattleDetailRecord[msg.record.battleUid] = msg.record
end
local GetCachedBattleDetailRecord = function(battleUid)
  return cachedBattleDetailRecord[battleUid]
end
local ClearCachedBattleDetailRecord = function()
  cachedBattleDetailRecord = {}
end
local SaveChallengeStageRsp = function(data)
  challengeStageRsp = data
end
local GetChallengeStageRsp = function()
  local data = challengeStageRsp
  challengeStageRsp = nil
  return data
end
local SetBattleRecord = function(record)
  if record then
    for _, oneRecord in ipairs(record) do
      if 1 ~= oneRecord.version then
        local stageConfig = TableData.GetConfig(oneRecord.stageId, "BaseStage")
        local shareCount = stageConfig.share_hp_count
        if shareCount and shareCount > 0 then
          oneRecord.damageHp = math.ceil(oneRecord.damageHp / shareCount)
        end
      end
    end
  end
  battleRecord = record
end
local GetBattleRecord = function()
  return battleRecord or {}
end
local SetGuildTaskInfo = function(info)
  taskInfo = info
end
local GetGuildTaskInfo = function()
  return taskInfo
end
local UpdateGuildTaskInfo = function(task)
  if taskInfo and task then
    for i = 1, #taskInfo do
      if taskInfo[i].uid == task.uid then
        taskInfo[i] = task
        break
      end
    end
  end
end
local GetCardState = function(cardId)
  local card = CardData.GetCardDataById(cardId)
  if nil == card then
    return GUILD_WAR_CARD_STATE.NOT_OBTAINED
  end
  if playerInfo then
    local usedSelfCardIds = playerInfo.usedSelfCardIds
    if table.contain(usedSelfCardIds, cardId) then
      return GUILD_WAR_CARD_STATE.USED_TODAY
    end
  end
  return GUILD_WAR_CARD_STATE.NORMAL
end
return {
  SetGuildScheduleInfo = SetGuildScheduleInfo,
  GetGuildScheduleInfo = GetGuildScheduleInfo,
  GetGuildWarConfig = GetGuildWarConfig,
  GetSkillTeamByTeamId = GetSkillTeamByTeamId,
  SetGuildWarProgressInfo = SetGuildWarProgressInfo,
  GetGuildWarProgressInfo = GetGuildWarProgressInfo,
  SetGuildPlayerInfo = SetGuildPlayerInfo,
  GetGuildPlayerInfo = GetGuildPlayerInfo,
  SetGuildTaskInfo = SetGuildTaskInfo,
  GetGuildTaskInfo = GetGuildTaskInfo,
  UpdateGuildTaskInfo = UpdateGuildTaskInfo,
  SetPlayerSkillTeam = SetPlayerSkillTeam,
  SetPlayerSkillLevel = SetPlayerSkillLevel,
  SetPlayerAssistCard = SetPlayerAssistCard,
  SetRankInfo = SetRankInfo,
  GetRankInfo = GetRankInfo,
  SetBattleRecord = SetBattleRecord,
  GetBattleRecord = GetBattleRecord,
  SetCachedBattleDetailRecord = SetCachedBattleDetailRecord,
  GetCachedBattleDetailRecord = GetCachedBattleDetailRecord,
  ClearCachedBattleDetailRecord = ClearCachedBattleDetailRecord,
  SaveChallengeStageRsp = SaveChallengeStageRsp,
  GetChallengeStageRsp = GetChallengeStageRsp,
  SetCompensateFormations = SetCompensateFormations,
  GetCompensateFormations = GetCompensateFormations,
  SetRecommendFormations = SetRecommendFormations,
  GetRecommendFormations = GetRecommendFormations,
  GetCardState = GetCardState
}
