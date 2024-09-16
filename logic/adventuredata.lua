AdventureData = {}
local sceneChaptersData = {}
local sceneInfos = {}

function AdventureData.ClearData()
  sceneChaptersData = {}
  sceneInfos = {}
end

function AdventureData.GetSceneData(type)
  if sceneInfos[type] then
    return sceneInfos[type]
  end
end

function AdventureData.GetSceneChapter(chapterId)
  return sceneChaptersData[chapterId]
end

function AdventureData.GetPassedStageInfo(stageId)
  for i, v in pairs(sceneChaptersData) do
    if v.stages[stageId] then
      return v.stages[stageId]
    end
  end
end

function AdventureData.GetChapterUnlocked(chapterId)
  if sceneChaptersData[chapterId] then
    return true
  end
  return false
end

function AdventureData.UpdateChapterStageData(msg)
  if msg.sceneChapters then
    for i, v in pairs(msg.sceneChapters) do
      AdventureData.SaveOneChapterData(v)
    end
  end
end

function AdventureData.ChallengeTableKey(tb)
  local t = {}
  for i, v in pairs(tb) do
    t[v.stageId] = v
  end
  return t
end

function AdventureData.SaveOneChapterData(data)
  if data and data.chapterId then
    data.stages = AdventureData.ChallengeTableKey(data.stages)
    sceneChaptersData[data.chapterId] = data
  end
end

function AdventureData.SaveOneStageInfo(info)
  for i, v in pairs(sceneChaptersData) do
    if v.chapterId == info.chapterId then
      v.stages[info.stageId] = info
    end
  end
end

function AdventureData.SaveSceneData(infos)
  for i, v in pairs(infos) do
    sceneInfos[v.sceneType] = v
    AdventureData.SaveOneChapterData(v.curChapterInfo)
  end
end

function AdventureData.SaveRewardedChapter(sceneType, rewardedChapter)
  if sceneInfos[sceneType] then
    sceneInfos[sceneType].rewardedChapter = rewardedChapter
  end
end

function AdventureData.SaveDailyStageNew(stageId, notCheckRemove)
  local dailyStageNew = OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.ADVENTURE_NEW)
  if stageId and not table.contain(dailyStageNew, stageId) then
    if not notCheckRemove then
      for i = #dailyStageNew, 1, -1 do
        if AdventureData.IsStagePassed(dailyStageNew[i]) then
          table.remove(dailyStageNew, i)
        end
      end
    end
    table.insert(dailyStageNew, stageId)
    OprRecordUtil.SaveRecord(PLAYER_OPERATION_ENUM.ADVENTURE_NEW, dailyStageNew)
  end
end

function AdventureData.CanShowStageNew(stageId)
  local dailyStageNew = OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.ADVENTURE_NEW)
  return not table.contain(dailyStageNew, stageId)
end

function AdventureData.GetStageData(chapterId, stageId)
  local chapterInfo = sceneChaptersData[chapterId]
  if chapterInfo and chapterInfo.stages[stageId] then
    return true
  end
  return false
end

function AdventureData.GetStageOpen(chapterId, stageId)
  local chapterInfo = sceneChaptersData[chapterId]
  if chapterInfo then
    if 0 ~= chapterInfo.stageOpenProgress then
      return stageId <= chapterInfo.stageOpenProgress
    else
      return chapterInfo.stages[stageId]
    end
  end
end

function AdventureData.GetMainPlotStageIsOpen(stageId)
  local stageData = TableData.GetConfig(stageId, "BaseStage")
  if stageData then
    local chapterData = TableData.GetConfig(stageData.chapter_id, "BaseChapter")
    if chapterData then
      local sceneInfo = AdventureData.GetSceneData(chapterData.type)
      if sceneInfo then
        if chapterData.id < sceneInfo.currentChapter then
          return true
        elseif chapterData.id == sceneInfo.currentChapter and (stageId <= sceneInfo.currentStage or 0 == sceneInfo.currentStage) then
          return true
        end
      end
    end
  end
end

function AdventureData.IsStagePassed(stageId)
  if stageId then
    local stageData = TableData.GetConfig(stageId, "BaseStage")
    if stageData then
      local chapterData = TableData.GetConfig(stageData.chapter_id, "BaseChapter")
      if chapterData then
        local sceneInfo = AdventureData.GetSceneData(chapterData.type)
        if sceneInfo then
          local typeEnum = ProtoEnum.SCENE_TYPE
          local GetStageDataType = {
            typeEnum.DAILY_MATERIAL,
            typeEnum.DAILY_COIN,
            typeEnum.DAILY_SKILL_BOOK,
            typeEnum.DAILY_ROLE_EXP,
            typeEnum.DAILY_QUALITY_UP,
            typeEnum.DAILY_BADGE_EXP,
            typeEnum.BOSS_FIRE,
            typeEnum.BOSS_WATER,
            typeEnum.BOSS_WOOD,
            typeEnum.BOSS_LIGHT,
            typeEnum.BOSS_DARK
          }
          if chapterData.type == typeEnum.MAIN_LINE then
            if chapterData.id < sceneInfo.currentChapter then
              return true
            elseif chapterData.id == sceneInfo.currentChapter and (stageId < sceneInfo.currentStage or 0 == sceneInfo.currentStage) then
              return true
            end
          elseif table.contain(GetStageDataType, chapterData.type) then
            local chapterInfo = sceneChaptersData[chapterData.id]
            if chapterInfo and chapterInfo.stages[stageId] then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function AdventureData.StageCanSweep(stageId)
  if stageId then
    local stageData = TableData.GetConfig(stageId, "BaseStage")
    if stageData and 1 == stageData.sweep_type then
      return AdventureData.IsStagePassed(stageId)
    end
  end
  return false
end
