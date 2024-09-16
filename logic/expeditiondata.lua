local expedData, curStageInfo, gotRewards, stageBattleRecords
local SetCurStageInfo = function(curStage)
  curStageInfo = curStageInfo or {}
  curStageInfo.id = curStage
  local stageConf = TableData.GetConfig(curStage, "BaseStage")
  if stageConf then
    curStageInfo.monsterGroup = stageConf.monster_group_list
  end
end
local SetRewardsInfo = function(rewards)
  gotRewards = rewards
end
local SortByChapterId = function(x, y)
  return x.chapterId < y.chapterId
end
local SetData = function(data)
  local disorder = data.chapters
  table.sort(disorder, SortByChapterId)
  expedData = data
  SetCurStageInfo(data.curStage)
  SetRewardsInfo(data.rewards)
end
local GetData = function()
  return expedData
end
local GetCurStageInfo = function()
  return curStageInfo
end
local GetRewardsInfo = function()
  return gotRewards
end
local GetMatchPower = function()
  return expedData.matchPower
end
local SetStageBattleRecords = function(stageId, record)
  stageBattleRecords = stageBattleRecords or {}
  if not stageBattleRecords[stageId] then
    stageBattleRecords[stageId] = {}
  end
  local i = record.battleData.initData.specialBattleIndex
  stageBattleRecords[stageId][i] = record
end
local GetStageBattleRecords = function()
  return stageBattleRecords
end
local ClearStageBattleRecords = function()
  stageBattleRecords = nil
end
return {
  SetData = SetData,
  GetData = GetData,
  GetCurStageInfo = GetCurStageInfo,
  GetMatchPower = GetMatchPower,
  GetRewardsInfo = GetRewardsInfo,
  SetCurStageInfo = SetCurStageInfo,
  SetRewardsInfo = SetRewardsInfo,
  SetStageBattleRecords = SetStageBattleRecords,
  GetStageBattleRecords = GetStageBattleRecords,
  ClearStageBattleRecords = ClearStageBattleRecords
}
