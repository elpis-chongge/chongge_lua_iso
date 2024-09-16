local GetClearedNumStages = function()
  local expedData = ExpeditionData.GetData()
  local curStage = expedData.curStage
  local chapters = expedData.chapters
  local records = expedData.records
  local stageOffset, stageCount = 0, 0
  for i, v in ipairs(chapters) do
    local chapterConf = TableData.GetConfig(v.chapterId, "BaseChapter")
    local stages = chapterConf.stages
    if -1 == curStage then
      stageCount = #stages + stageOffset
    else
      local exists, indexOfStage = table.contain(stages, curStage)
      if exists then
        stageCount = indexOfStage + stageOffset
        break
      end
    end
    stageOffset = stageOffset + #stages
  end
  local curStagePassed = table.keyof(records, curStage, "stageId")
  return (curStagePassed or -1 == curStage) and stageCount or stageCount - 1
end
local GetChapterIndexByStageId = function(stageId)
  local expedData = ExpeditionData.GetData()
  local chapters = expedData.chapters
  local chapterIndex, stageIndex = 0, 0
  for i, v in ipairs(chapters) do
    local chapterConf = TableData.GetConfig(v.chapterId, "BaseChapter")
    if chapterConf then
      local exists, index = table.contain(chapterConf.stages, stageId)
      if exists then
        chapterIndex = i
        stageIndex = index
        break
      end
    end
  end
  return chapterIndex, stageIndex
end
local GetLatestChapterIndex = function()
  local expedData = ExpeditionData.GetData()
  local chapters = expedData.chapters
  local curStage = expedData.curStage
  if -1 == curStage then
    local chapterIndex = #chapters
    local chapterId = chapters[chapterIndex].chapterId
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    return chapterIndex, #chapterConf.stages
  end
  local chapterIndex, stageIndex = 0, 0
  for i, v in ipairs(chapters) do
    local chapterConf = TableData.GetConfig(v.chapterId, "BaseChapter")
    if chapterConf then
      local exists, index = table.contain(chapterConf.stages, curStage)
      if exists then
        chapterIndex = i
        stageIndex = index
        break
      end
    end
  end
  for i = chapterIndex, 1, -1 do
    local chapterId = chapters[i].chapterId
    if ExpeditionMgr.IsChapterUnlock(chapterId) then
      break
    end
    chapterIndex = i - 1
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    stageIndex = #chapterConf.stages
  end
  return chapterIndex, stageIndex
end
local GetAllStageStars = function()
  local result = 0
  local expedData = ExpeditionData.GetData()
  local chapters = expedData.chapters
  for _, v in pairs(chapters) do
    local chapterConf = TableData.GetConfig(v.chapterId, "BaseChapter")
    local stages = chapterConf.stages
    for _, vv in pairs(stages) do
      local stageConf = TableData.GetConfig(vv, "BaseStage")
      local conditions = stageConf.challenge_condition
      if conditions then
        result = result + #conditions
      end
    end
  end
  return result
end
local GetAchievedChallenges = function(stageId, buffer)
  local challenges = buffer or {}
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local conditions = stageConf.challenge_condition
  if conditions then
    local expedData = ExpeditionData.GetData()
    local records = expedData.records
    local k = table.keyof(records, stageId, "stageId")
    local record = k and records[k]
    for _, v in ipairs(conditions) do
      local achieved = false
      if record then
        achieved = table.keyof(record.challenged, v)
      end
      local conf = TableData.GetConfig(v, "BaseStageChallenge")
      local challenge = {
        id = v,
        name = conf.name,
        achieved = achieved
      }
      table.insert(challenges, challenge)
    end
  end
  return challenges
end
local GetAchievedChallengeCount = function(stageId)
  local cnt = 0
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local conditions = stageConf.challenge_condition
  if conditions then
    local expedData = ExpeditionData.GetData()
    local records = expedData.records
    local k = table.keyof(records, stageId, "stageId")
    local record = k and records[k]
    for _, v in ipairs(conditions) do
      if record and table.keyof(record.challenged, v) then
        cnt = cnt + 1
      end
    end
  end
  return cnt
end
local GetChapterBuff = function(chapterIndex)
  local expedData = ExpeditionData.GetData()
  local chapterData = expedData.chapters[chapterIndex]
  return chapterData.buffID
end
local IsStagePassed = function(stageId)
  local expedData = ExpeditionData.GetData()
  local chapters = expedData.chapters
  local flag, i = false, 0
  for _, v in ipairs(chapters) do
    local chapterConf = TableData.GetConfig(v.chapterId, "BaseChapter")
    for _, vv in ipairs(chapterConf.stages) do
      i = i + 1
      if stageId == vv then
        flag = true
        break
      end
    end
    if flag then
      break
    end
  end
  if flag then
    return i <= GetClearedNumStages()
  end
  return false
end
local IsChapterCleared = function(chapterId)
  local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
  local cleared = true
  for _, v in pairs(chapterConf.stages) do
    if not IsStagePassed(v) then
      cleared = false
      break
    end
  end
  return cleared
end
local IsChapterUnlock = function(chapterId)
  local conf = TableData.GetConfig(chapterId, "BaseChapter")
  local prechapter = true
  if conf.pre and conf.pre > 0 then
    prechapter = IsChapterCleared(conf.pre)
  end
  local remaining = 0
  if conf.unlock_time then
    local expedData = ExpeditionData.GetData()
    local chapters = expedData.chapters
    local k = table.keyof(chapters, chapterId, "chapterId")
    if k then
      remaining = chapters[k].unlockStamp - LoginData.GetCurServerTime()
    end
  end
  return prechapter and remaining <= 0, prechapter, remaining
end
local IsClearedThisTime = function()
  local expedData = ExpeditionData.GetData()
  local allStars = GetAllStageStars()
  return allStars <= expedData.highPassStar
end
local stageRecords
local KeepStage = function(stageId)
  if not table.contain(stageRecords, stageId) then
    table.insert(stageRecords, stageId)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.EXPEDITION_STAGE_RECORD, Json.encode(stageRecords), ExpeditionData.GetData().nextRefreshStamp)
  end
end
local IsNewStage = function(stageId)
  if IsStagePassed(stageId) then
    return false
  end
  return stageRecords and not table.contain(stageRecords, stageId)
end
local InitStageRecords = function()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.EXPEDITION_STAGE_RECORD, "", ExpeditionData.GetData().nextRefreshStamp)
  if string.isEmptyOrNil(str) then
    stageRecords = {}
  else
    stageRecords = Json.decode(str)
  end
end
local OnBattleComplete = function(msg)
  ExpeditionMgr.restart_timeline_animator = false
end
local battleUIDBuffer
local RequestStageRecords = function(chapterIndex, callback, checkIsNecessary)
  battleUIDBuffer = battleUIDBuffer or {}
  table.clear(battleUIDBuffer)
  local expedData = ExpeditionData.GetData()
  local records = expedData.records
  if records and _G.next(records) then
    local chapter = expedData.chapters[chapterIndex]
    local conf = TableData.GetConfig(chapter.chapterId, "BaseChapter")
    local stages = conf.stages
    for _, stageId in ipairs(stages) do
      local k = table.keyof(records, stageId, "stageId")
      if k then
        for _, uid in pairs(records[k].battleUid) do
          table.insert(battleUIDBuffer, uid)
        end
      end
    end
    if checkIsNecessary then
      local recordsCache = ExpeditionData.GetStageBattleRecords()
      if recordsCache then
        for stageId, completeDatas in pairs(recordsCache) do
          for _, completeData in pairs(completeDatas) do
            local index = table.keyof(battleUIDBuffer, completeData.battleUid)
            if type(index) == "number" then
              table.remove(battleUIDBuffer, index)
            end
          end
        end
      end
    end
    local recordsCnt = #battleUIDBuffer
    if recordsCnt > 0 then
      local progress = 0
      for _, battleUid in pairs(battleUIDBuffer) do
        ExpeditionService.GetBattleRecordReq(battleUid, function(msg)
          local battleData = Net.DecodePb("BattleCompleteData", msg.record.data)
          msg.record.battleData = battleData
          local stageId = battleData.initData.stageId
          ExpeditionData.SetStageBattleRecords(stageId, msg.record)
          progress = progress + 1
          if progress == recordsCnt and type(callback) == "function" then
            callback()
          end
        end)
      end
      return
    end
  end
  if type(callback) == "function" then
    callback()
  end
end
local RequestAllStageRecords = function(callback, checkIsNecessary)
  battleUIDBuffer = battleUIDBuffer or {}
  table.clear(battleUIDBuffer)
  local expedData = ExpeditionData.GetData()
  local records = expedData.records
  if records and _G.next(records) then
    for i, chapter in ipairs(expedData.chapters) do
      local conf = TableData.GetConfig(chapter.chapterId, "BaseChapter")
      local stages = conf.stages
      for _, stageId in ipairs(stages) do
        local k = table.keyof(records, stageId, "stageId")
        if k then
          for _, uid in pairs(records[k].battleUid) do
            table.insert(battleUIDBuffer, uid)
          end
        end
      end
    end
    if checkIsNecessary then
      local recordsCache = ExpeditionData.GetStageBattleRecords()
      if recordsCache then
        for stageId, completeDatas in pairs(recordsCache) do
          for _, completeData in pairs(completeDatas) do
            local index = table.keyof(battleUIDBuffer, completeData.battleUid)
            if type(index) == "number" then
              table.remove(battleUIDBuffer, index)
            end
          end
        end
      end
    end
    local recordsCnt = #battleUIDBuffer
    if recordsCnt > 0 then
      local progress = 0
      for _, battleUid in pairs(battleUIDBuffer) do
        ExpeditionService.GetBattleRecordReq(battleUid, function(msg)
          local battleData = Net.DecodePb("BattleCompleteData", msg.record.data)
          msg.record.battleData = battleData
          local stageId = battleData.initData.stageId
          ExpeditionData.SetStageBattleRecords(stageId, msg.record)
          progress = progress + 1
          if progress == recordsCnt and type(callback) == "function" then
            callback()
          end
        end)
      end
      return
    end
  end
  if type(callback) == "function" then
    callback()
  end
end
local lastChapterIndex
local SetLastChapterIndex = function(val)
  lastChapterIndex = val
end
local GetLastChapterIndex = function()
  return lastChapterIndex
end
local HasAnyBattleRecord = function()
  local records = ExpeditionData.GetStageBattleRecords()
  if not records or not _G.next(records) then
    return false
  end
  return true
end
local TryOpenExpeditionBattleReviewWindow = function()
  RequestAllStageRecords(function()
    if HasAnyBattleRecord() then
      OpenWindow(WinResConfig.ExpeditionBattleReviewWindow.name)
    else
      FloatTipsUtil.ShowWarnTips(T(20250))
    end
  end, true)
end
return {
  GetClearedNumStages = GetClearedNumStages,
  GetChapterIndexByStageId = GetChapterIndexByStageId,
  GetLatestChapterIndex = GetLatestChapterIndex,
  GetAllStageStars = GetAllStageStars,
  GetChapterBuff = GetChapterBuff,
  GetAchievedChallenges = GetAchievedChallenges,
  GetAchievedChallengeCount = GetAchievedChallengeCount,
  IsStagePassed = IsStagePassed,
  IsChapterUnlock = IsChapterUnlock,
  IsClearedThisTime = IsClearedThisTime,
  KeepStage = KeepStage,
  IsNewStage = IsNewStage,
  InitStageRecords = InitStageRecords,
  OnBattleComplete = OnBattleComplete,
  RequestStageRecords = RequestStageRecords,
  RequestAllStageRecords = RequestAllStageRecords,
  SetLastChapterIndex = SetLastChapterIndex,
  GetLastChapterIndex = GetLastChapterIndex,
  HasAnyBattleRecord = HasAnyBattleRecord,
  TryOpenExpeditionBattleReviewWindow = TryOpenExpeditionBattleReviewWindow
}
