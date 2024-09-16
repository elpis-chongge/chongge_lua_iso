local raidBossData, playersRankData, playersRankInfoList
local GetLevelList = function()
  local data = RaidBossData.GetRaidBossData()
  local chapter = data.curChapter
  local conf = TableData.GetConfig(chapter, "BaseChapter")
  return conf.stages
end
local GetLevelIdByDifficult = function(diff)
  local levels = GetLevelList()
  if levels then
    for _, v in ipairs(levels) do
      local conf = TableData.GetConfig(v, "BaseStage")
      if diff == conf.difficulty_level then
        return v
      end
    end
  end
end
local GetLevelRecords = function()
  return raidBossData.challenge
end
local GetDeadline = function()
  return raidBossData.endStamp
end
local GetRemainingChallenges = function(hard)
  return hard and raidBossData.challengeCount or raidBossData.fighterCount
end
local GetSeason = function()
  return raidBossData.season
end
local GetBossMaxHp = function()
  return raidBossData.bossHpMax
end
local GetBossHp = function()
  return raidBossData.bossHpCur
end
local SetRaidBossData = function(data)
  raidBossData = data
end
local GetRaidBossData = function()
  return raidBossData
end
local GetPlayerRank = function(ratio)
  return ratio and raidBossData.rankRatio or raidBossData.rank
end
local SetPlayersRankData = function(data)
  playersRankData = data
  local index = playersRankData.index
  local rankList = playersRankData.rankList
  playersRankInfoList = playersRankInfoList or {}
  for i = 1, #rankList do
    playersRankInfoList[i + index - 1] = rankList[i]
  end
end
local GetPlayersRankData = function()
  return playersRankData
end
local GetPlayerRankInfoAt = function(rank)
  return playersRankInfoList and playersRankInfoList[rank]
end
local GetPlayerRankInfo = function(uin)
  for _, v in pairs(playersRankInfoList) do
    if v.uin == uin then
      return v
    end
  end
end
local ClearPlayerRankInfo = function()
  if playersRankInfoList then
    table.clear(playersRankInfoList)
  end
end
local rankUpdateInfo
local SetRankUpdateInfo = function(info)
  rankUpdateInfo = info
end
local GetRankUpdateInfo = function()
  return rankUpdateInfo
end
return {
  GetLevelList = GetLevelList,
  GetLevelIdByDifficult = GetLevelIdByDifficult,
  GetLevelRecords = GetLevelRecords,
  GetDeadline = GetDeadline,
  GetRemainingChallenges = GetRemainingChallenges,
  GetSeason = GetSeason,
  GetBossHp = GetBossHp,
  GetBossMaxHp = GetBossMaxHp,
  GetPlayerRank = GetPlayerRank,
  SetRaidBossData = SetRaidBossData,
  GetRaidBossData = GetRaidBossData,
  SetPlayersRankData = SetPlayersRankData,
  GetPlayersRankData = GetPlayersRankData,
  GetPlayerRankInfo = GetPlayerRankInfo,
  GetPlayerRankInfoAt = GetPlayerRankInfoAt,
  ClearPlayerRankInfo = ClearPlayerRankInfo,
  SetRankUpdateInfo = SetRankUpdateInfo,
  GetRankUpdateInfo = GetRankUpdateInfo
}
