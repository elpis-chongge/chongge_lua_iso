ActivityDungeonData = {}
local activityConfig = {}
local activityStage = {}
local curShowId

function ActivityDungeonData.ClearData()
  activityConfig = {}
  activityStage = {}
  curShowId = nil
end

function ActivityDungeonData.SaveShowId(showId)
  curShowId = showId
end

function ActivityDungeonData.GetShowId()
  return curShowId
end

function ActivityDungeonData.SaveActivityInfo(msg)
  if msg.stageAct then
    for i, v in pairs(msg.stageAct) do
      local data = TableData.GetConfig(v.baseInfo.activityId, "BaseActivity")
      if data and data.type == 10119 then
        local config = TableData.GetConfig(tonumber(data.parameter), "BaseActivityStageConfig")
        if config and config.show_id then
          ActivityDungeonData.SetActivityInfo(v, config.show_id)
          ActivityDungeonData.SaveActivityData(config, config.show_id)
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
        end
      end
    end
  end
end

function ActivityDungeonData.SaveActivityData(config, showId)
  activityConfig = activityConfig or {}
  activityConfig[showId] = config
end

function ActivityDungeonData.SetActivityInfo(info, showId)
  activityStage = activityStage or {}
  activityStage[showId] = info
end

function ActivityDungeonData.GetActivityInfo()
  return activityStage[curShowId]
end

function ActivityDungeonData.GetActivityStageByShowId(showId)
  return activityStage[showId]
end

function ActivityDungeonData.GetActivityDataByShowId(showId)
  return activityConfig[showId]
end

function ActivityDungeonData.UpdateCreamCount()
  if activityStage[curShowId] then
    activityStage[curShowId].creamCount = activityStage[curShowId].creamCount - 1
  end
end

function ActivityDungeonData.UpdateSignInfo(signDay, curDay)
  if signDay then
    activityStage[curShowId].signDay = signDay
  end
end

function ActivityDungeonData.UpdateBoughtItem(boughtItem)
  if boughtItem then
    activityStage[curShowId].boughtItem = boughtItem
  end
end

function ActivityDungeonData.UpdateOneTask(taskInfo)
  if taskInfo and activityStage[curShowId] and activityStage[curShowId].taskList then
    for i, v in ipairs(activityStage[curShowId].taskList) do
      if v.taskId == taskInfo.taskId then
        activityStage[curShowId].taskList[i] = taskInfo
        return
      end
    end
  end
end

function ActivityDungeonData.GetActivityData()
  return activityConfig[curShowId]
end

function ActivityDungeonData.GetAllActivityStage()
  local allData = {}
  for i, v in pairs(activityStage) do
    table.insert(allData, v)
  end
  return allData
end
