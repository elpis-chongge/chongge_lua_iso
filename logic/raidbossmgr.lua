local GetLevelIndex = function(stageId)
  local levels = RaidBossData.GetLevelList()
  local result = 0
  for i = 1, #levels do
    if stageId == levels[i] then
      result = i - 1
      break
    end
  end
  return result
end
local GetLatestLevelIndex = function()
  local data = RaidBossData.GetRaidBossData()
  return GetLevelIndex(data.curStage)
end
local GetLatestRoundIndex = function()
  local data = RaidBossData.GetRaidBossData()
  if data.challenge and _G.next(data.challenge) then
    return #data.challenge
  end
  return 0
end
local GetLevelsCount = function()
  local levels = RaidBossData.GetLevelList()
  if levels then
    return #levels
  end
  return 0
end
local GetCurLevelRounds = function()
  local data = RaidBossData.GetRaidBossData()
  local curStage = data.curStage
  if curStage then
    local conf = TableData.GetConfig(curStage, "BaseStage")
    return conf.rounds
  end
end
local IsChallenging = function()
  local raidBossData = RaidBossData.GetRaidBossData()
  return raidBossData and raidBossData.isStart
end
local IsHardestLevel = function(stageId)
  local levels = RaidBossData.GetLevelList()
  if levels then
    return stageId == levels[#levels]
  end
  return false
end
local IsPassed = function(stageId)
  local levelIndex = GetLevelIndex(stageId)
  return levelIndex >= 0 and levelIndex < GetLatestLevelIndex()
end
local GetRaidBossConfig = function(chapterId)
  local conf = TableData.GetConfig(chapterId, "BaseChapter")
  return RaidBossConfig[conf.show_type]
end
local GetCurrentRaidBossConfig = function()
  local raidBossData = RaidBossData.GetRaidBossData()
  local chapterId = raidBossData.curChapter
  return GetRaidBossConfig(chapterId)
end
local params = {
  stageId = -1,
  sceneType = ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE,
  extData = nil,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end
}
local PrepareEnterBattle = function(stageId, simulate, callback)
  params.stageId = stageId
  params.simulate = simulate
  if not FormationMgr then
    ld("Formation")
  end
  FormationMgr.cachedLastFormationParams = params
  FormationMgr.cachedLastFormationOpenWindowAfterRsp = false
  local f = function(msg)
    if msg.info then
      if params.sceneType == msg.info.sceneType and params.stageId == msg.info.stageId then
        FormationMgr.OpenFormationWindow(params)
      end
    else
      FormationMgr.OpenFormationWindow(params)
    end
    if type(callback) == "function" then
      callback()
    end
  end
  FormationService.GetStagePrepareInfoReq(params.sceneType, params.stageId, f)
end
local indexesBuffer
local RequireRankInfo = function(startIndex, rspCallback)
  indexesBuffer = indexesBuffer or {}
  local length = 10
  for i, v in ipairs(indexesBuffer) do
    if v <= startIndex and startIndex < v + length then
      return
    end
  end
  table.insert(indexesBuffer, startIndex)
  RaidBossService.GetPlayerRankInfoReq(startIndex, rspCallback)
end
local ClearPlayerRankCache = function()
  RaidBossData.ClearPlayerRankInfo()
  if indexesBuffer then
    table.clear(indexesBuffer)
  end
end
local OnBattleComplete = function(msg)
  RaidBossService.GetRaidBossInfoReq()
end
local HasNewRanInfo = function(rank)
  local data = RaidBossData.GetRaidBossData()
  local rankUpInfo = data.rankUpInfo
  data.rankUpInfo = nil
  if rankUpInfo then
    return true, rankUpInfo
  end
  return false
end
local IsCardUsed = function(cardId)
  local data = RaidBossData.GetRaidBossData()
  if data then
    local challenge = data.challenge
    if challenge then
      for _, v in pairs(challenge) do
        local map = v.cardList
        for id, _ in pairs(map) do
          if id == cardId then
            return true
          end
        end
      end
    end
  end
  return false
end
local IsInProgress = function(displayTips)
  local data = RaidBossData.GetRaidBossData()
  local serverTimestamp = LoginData.GetCurServerTime()
  local inProgress = true
  if serverTimestamp > data.endStamp and serverTimestamp < data.nextStartStamp then
    inProgress = false
    if displayTips then
      local diff = data.nextStartStamp - serverTimestamp
      FloatTipsUtil.ShowWarnTips(T(20331, TimeUtil.FormatEnTime(diff)))
    end
  end
  return inProgress
end
return {
  IsPassed = IsPassed,
  IsChallenging = IsChallenging,
  IsHardestLevel = IsHardestLevel,
  IsCardUsed = IsCardUsed,
  IsInProgress = IsInProgress,
  GetLevelsCount = GetLevelsCount,
  GetCurLevelRounds = GetCurLevelRounds,
  GetLatestLevelIndex = GetLatestLevelIndex,
  GetLatestRoundIndex = GetLatestRoundIndex,
  GetRaidBossConfig = GetRaidBossConfig,
  GetCurrentRaidBossConfig = GetCurrentRaidBossConfig,
  PrepareEnterBattle = PrepareEnterBattle,
  RequireRankInfo = RequireRankInfo,
  OnBattleComplete = OnBattleComplete,
  HasNewRanInfo = HasNewRanInfo,
  ClearPlayerRankCache = ClearPlayerRankCache
}
