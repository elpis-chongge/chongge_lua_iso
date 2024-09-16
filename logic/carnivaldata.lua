CarnivalData = {info = nil}
local homeTaskId = 0
local refreshStamp = 0
local enterActivityId = 0

function CarnivalData.GetRefreshStamp()
  return refreshStamp
end

function CarnivalData.RefreshRefreshStamp(time)
  if time and time > 0 then
    refreshStamp = time
  end
end

function CarnivalData.SaveHomeTaskId(taskId)
  homeTaskId = taskId
end

function CarnivalData.GetHomeTaskId()
  return homeTaskId
end

function CarnivalData.GetEnterActivityId()
  return enterActivityId
end

function CarnivalData.SaveEnterActivityId(activityId)
  enterActivityId = activityId
end

function CarnivalData.GetHomeShowTask()
  if not CarnivalData.CarnivalIsUnlock() then
    return
  end
  local tb = SimpleCopy(CarnivalData.info.stageList)
  if #tb > 1 then
    table.sort(tb, function(a, b)
      return a.stageId > b.stageId
    end)
  end
  local curState, curTask
  for _, tabIndex in ipairs(tb) do
    local tasks = tabIndex.taskList
    if tasks then
      for _, v in ipairs(tasks) do
        if v.state == ProtoEnum.TASK_STATE.NORMAL or v.state == ProtoEnum.TASK_STATE.FINISHED then
          if nil == curState then
            curState = v.state
            curTask = v
          elseif curState < v.state then
            curState = v.state
            curTask = v
          end
        end
      end
    end
  end
  if curTask then
    local taskConfig = TableData.GetConfig(curTask.taskId, "BaseTask")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.name(),
      value = curTask.value,
      targetValue = taskConfig.task_parameter[1],
      taskUid = curTask.uid
    }
  end
  return
end

function CarnivalData.ActivityIsUnlock(activityId)
  local funTb = {
    [ACTIVITY_ID.INITIAL_SIGN] = CarnivalData.InitialSignIsUnlock,
    [ACTIVITY_ID.CARNIVAL] = CarnivalData.CarnivalIsUnlock,
    [ACTIVITY_ID.BIOGRAPHY] = CarnivalData.BiographyIsUnlock,
    [ACTIVITY_ID.LV_GIFT] = CarnivalData.LvGiftIsUnlock
  }
  if nil == funTb[activityId] then
    return true
  end
  return funTb[activityId]()
end

function CarnivalData.InitialSignIsUnlock()
  if SignData == nil or nil == SignData.activityData then
    return false
  end
  local signData = SignData.activityData[ACTIVITY_ID.INITIAL_SIGN]
  if signData then
    if signData.curDay > 8 then
      return false
    else
      return true
    end
  end
end

function CarnivalData.SignIsShowHome()
  if CarnivalData.InitialSignIsUnlock() then
    local signData = SignData.activityData[ACTIVITY_ID.INITIAL_SIGN]
    if signData and signData.isTodaySignIn == false then
      local taskConfig = TableData.GetConfig(ACTIVITY_ID.INITIAL_SIGN, "BaseActivity")
      return {
        url = UIUtil.GetResUrl(taskConfig.home_icon),
        text = taskConfig.home_des()
      }
    end
  end
end

function CarnivalData.CarnivalIsUnlock()
  if CarnivalData.info and (CarnivalData.info.closedStamp > LoginData.GetCurServerTime() or 0 == CarnivalData.info.closedStamp) then
    return true
  end
end

function CarnivalData.BiographyIsUnlock()
  if BiographyData.plantInfo.plantList and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BIOGRAPHY, false) then
    return #BiographyData.plantInfo.plantList > 0
  end
end

function CarnivalData.LvGiftIsUnlock()
  local data = CarnivalData.GetLvGiftData()
  if ShopData and data and data.gift_reward_ids then
    local info = ShopData.GetGiftInfoById(data.id)
    if info and #info.rewards ~= #data.gift_reward_ids then
      return true
    end
  end
end

function CarnivalData.GetLvGiftData()
  local data = TableData.GetTable("BaseGift")
  for i, v in pairs(data) do
    if v.type and 3 == v.type then
      return v
    end
  end
end

function CarnivalData.GetCarnivalTargetData()
  local config = TableData.GetTable("BaseActivityCarnivalTarget")
  local tb = {}
  for i, v in pairs(config) do
    table.insert(tb, v)
  end
  table.sort(tb, function(a, b)
    return a.index < b.index
  end)
  return tb
end

function CarnivalData.GetCarnivalTotalDay()
  local config = TableData.GetTable("BaseActivityCarnival")
  local day = 0
  for i, v in pairs(config) do
    day = day + 1
  end
  return day
end

function CarnivalData.GetCarnivalCurrentDay()
  return #CarnivalData.info.stageList
end

function CarnivalData.ShowHomeCarnivalTarget()
  if RedDotTask.CanCarnivalTarget() then
    local taskConfig = TableData.GetConfig(ACTIVITY_ID.CARNIVAL, "BaseActivity")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.home_des()
    }
  end
end

function CarnivalData.ShowHomeLvGift()
  if RedDotTask.CanLvGift() then
    local taskConfig = TableData.GetConfig(ACTIVITY_ID.LV_GIFT, "BaseActivity")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.home_des()
    }
  end
end
