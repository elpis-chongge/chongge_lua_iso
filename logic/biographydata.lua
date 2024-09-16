BiographyData = {
  plantInfo = {}
}
local refreshStamp = 0

function BiographyData.GetRefreshStamp()
  return refreshStamp
end

function BiographyData.RefreshRefreshStamp(time)
  if time and time > 0 then
    refreshStamp = time
  end
end

function BiographyData.GetInfoByPlantId(id)
  if BiographyData.plantInfo.plantList then
    for i, v in pairs(BiographyData.plantInfo.plantList) do
      if v.plantId == id then
        return v
      end
    end
  end
end

function BiographyData.GetIndexByPlantId(id)
  if BiographyData.plantInfo.plantList then
    for i, v in pairs(BiographyData.plantInfo.plantList) do
      if v.plantId == id then
        return i
      end
    end
  end
end

function BiographyData.GetHomeShowTask()
  if not CarnivalData.BiographyIsUnlock() then
    return
  end
  local curTask = BiographyData.plantInfo.dailyTask
  if curTask and (curTask.state == ProtoEnum.TASK_STATE.NORMAL or curTask.state == ProtoEnum.TASK_STATE.FINISHED) then
    local taskConfig = TableData.GetConfig(curTask.taskId, "BaseTask")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.name(),
      value = curTask.value,
      targetValue = taskConfig.task_parameter[1]
    }
  end
  return
end

function CarnivalData.BiographyShowHome()
  if RedDotTask.CanBiographyFlower() then
    local taskConfig = TableData.GetConfig(ACTIVITY_ID.BIOGRAPHY, "BaseActivity")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.home_des()
    }
  end
end
