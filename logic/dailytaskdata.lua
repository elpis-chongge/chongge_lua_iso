DailyTaskData = {}
local taskList, dailyRewards, totalRewards
local refreshStamp = 0
local dailyItemId, totalItemId
DAILY_TASK_TAB = {DAILY = 0, EXPLORE = 1}
REWARD_PHASE_STATE = {
  INPROGRESS = 0,
  COMPLETE = 1,
  LOCK = 2
}
local rebuildTargetTask

function DailyTaskData.InitTaskData()
  if nil == dailyItemId or nil == totalItemId then
    local config = TableData.GetConfig(70010017, "BaseFixed")
    if config and config.array_value then
      local ids = Split(config.array_value, "|")
      dailyItemId = tonumber(ids[1])
      totalItemId = tonumber(ids[2])
    end
  end
  if nil == rebuildTargetTask then
    rebuildTargetTask = {}
    local config = TableData.GetTable("BaseTaskTarget")
    for i, v in pairs(config) do
      if v.phase then
        rebuildTargetTask[v.phase * 100 + v.index] = SimpleCopy(v)
      end
    end
  end
  taskList = {}
  dailyRewards = {}
  totalRewards = {}
  refreshStamp = 0
end

function DailyTaskData.UpdateTaskData(data)
  local newTaskList = data.taskList
  if #newTaskList > 0 then
    for _, newTask in ipairs(newTaskList) do
      local isFind = false
      for _, task in ipairs(taskList) do
        if newTask.index == task.index then
          task.task = newTask.task
          isFind = true
        end
      end
      if false == isFind then
        table.insert(taskList, newTask)
      end
    end
  end
  dailyRewards = data.dailyRewards
  totalRewards = data.totalRewards
  refreshStamp = data.refreshStamp
end

function DailyTaskData.UpdateTaskReplace(data)
  local replaceTaskIndex = {}
  local newTaskList = data.taskList
  for _, newTask in ipairs(newTaskList) do
    for i, task in ipairs(taskList) do
      if task.index == newTask.index then
        task.task = newTask.task
        if newTask.task.startStamp == data.refreshStamp then
          table.insert(replaceTaskIndex, newTask.index)
        end
      end
    end
  end
  refreshStamp = data.refreshStamp
  return replaceTaskIndex
end

function DailyTaskData.UpdateTaskReward(rewardRsp)
  totalRewards = rewardRsp.totalRewards
  dailyRewards = rewardRsp.dailyRewards
  taskList = rewardRsp.taskList
  refreshStamp = rewardRsp.refreshStamp
  local goodsCount = #rewardRsp.goods
  if goodsCount > 0 then
    for i = goodsCount, 1, -1 do
      local item = rewardRsp.goods[i]
      local id = item.itemId or item.item.itemId
      if 21000012 == id or 21000015 == id then
        table.remove(rewardRsp.goods, i)
      end
    end
    GetItemTips.Show(rewardRsp.goods, nil, function()
      if DailyTaskData.lastLv and DailyTaskData.lastLv < ActorData.GetLevel() then
        OpenWindow(WinResConfig.LevelUpWindow.name, nil, nil, DailyTaskData.lastLv)
      end
    end)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
end

function DailyTaskData.GetRefreshStamp()
  return refreshStamp
end

function DailyTaskData.GetTaskList()
  local list = {}
  for i, v in ipairs(taskList) do
    if v.task.state == ProtoEnum.TASK_STATE.FINISHED then
      v.sortIndex = 3
    elseif v.task.state == ProtoEnum.TASK_STATE.NORMAL then
      v.sortIndex = 2
    else
      v.sortIndex = 1
    end
    table.insert(list, v)
  end
  table.sort(list, function(a, b)
    if a.sortIndex == b.sortIndex then
      return a.index < b.index
    else
      return a.sortIndex > b.sortIndex
    end
  end)
  return list
end

function DailyTaskData.GetGrowItem()
  return ActorData.GetItemCount(totalItemId), totalItemId
end

function DailyTaskData.GetGrowShow()
  local rewardGroups = DailyTaskData.GetAllRewardGroupByPhase()
  local gotTargetList = {}
  local reachTargetList = {}
  local unreachedTargetList = {}
  local curItemCount = ActorData.GetItemCount(totalItemId)
  local config = TableData.GetTable("BaseTaskTarget")
  for _, v in pairs(config) do
    if 2 == v.type and rewardGroups[v.phase].state ~= REWARD_PHASE_STATE.LOCK then
      if DailyTaskData.IsRewardGot(v.id, v.type) then
        table.insert(gotTargetList, v)
      elseif curItemCount >= v.unlock_points then
        table.insert(reachTargetList, v)
      else
        table.insert(unreachedTargetList, v)
      end
    end
  end
  table.sort(gotTargetList, function(a, b)
    return a.id < b.id
  end)
  table.sort(reachTargetList, function(a, b)
    return a.id < b.id
  end)
  table.sort(unreachedTargetList, function(a, b)
    return a.id < b.id
  end)
  if #reachTargetList > 0 then
    return reachTargetList[1], true, false
  end
  if #unreachedTargetList <= 0 then
    return gotTargetList[#gotTargetList], true, true
  end
  return unreachedTargetList[1], false, false
end

function DailyTaskData.GetAllRewardGroupByPhase()
  local rewardGroups = {}
  local config = TableData.GetTable("BaseTaskTarget")
  for _, v in pairs(config) do
    if v.phase then
      if rewardGroups[v.phase] == nil then
        rewardGroups[v.phase] = {
          rewards = {}
        }
      end
      table.insert(rewardGroups[v.phase].rewards, v)
    end
  end
  local curCompletePhase = 0
  for i, v in ipairs(rewardGroups) do
    if DailyTaskData.IsPhaseRewardGot(v) == true then
      v.state = REWARD_PHASE_STATE.COMPLETE
      curCompletePhase = i
    elseif i == curCompletePhase + 1 then
      v.state = REWARD_PHASE_STATE.INPROGRESS
    else
      v.state = REWARD_PHASE_STATE.LOCK
    end
  end
  return rewardGroups
end

function DailyTaskData.GetMaxPhaseId()
  local maxPhase = 0
  local config = TableData.GetTable("BaseTaskTarget")
  for i, v in pairs(config) do
    if 2 == v.type and v.phase then
      maxPhase = math.max(maxPhase, v.phase)
    end
  end
  return maxPhase
end

function DailyTaskData.IsPhaseRewardGot(rewardGroup)
  local rewards = rewardGroup.rewards
  for i, v in ipairs(rewards) do
    if DailyTaskData.IsRewardGot(v.id, v.type) == false then
      return false
    end
  end
  return true
end

function DailyTaskData.GetDailyItem()
  return ActorData.GetItemCount(dailyItemId), dailyItemId
end

function DailyTaskData.GetDailyReward()
  local config = TableData.GetTable("BaseTaskTarget")
  local dailyRewardList = {}
  for _, v in pairs(config) do
    if 3 == v.type then
      table.insert(dailyRewardList, {
        config = v,
        isGot = DailyTaskData.IsRewardGot(v.id, v.type)
      })
    end
  end
  table.sort(dailyRewardList, function(a, b)
    return a.config.index < b.config.index
  end)
  return dailyRewardList
end

function DailyTaskData.IsRewardGot(id, type)
  local rewardRecord
  if 1 == type then
  elseif 2 == type then
    rewardRecord = totalRewards
  elseif 3 == type then
    rewardRecord = dailyRewards
  end
  if rewardRecord and #rewardRecord > 0 then
    for _, v in ipairs(rewardRecord) do
      if v == id then
        return true
      end
    end
  end
  return false
end

function DailyTaskData.GetTaskCommonReward(index)
  local rewards = {}
  local configTable = TableData.GetTable("BaseTaskCommon")
  for i, v in pairs(configTable) do
    if v.index == index then
      local reward = v.reward
      for _, rew in ipairs(reward) do
        local strs = Split(rew, ":")
        local id = tonumber(strs[2])
        if id ~= totalItemId then
          local count = tonumber(strs[3])
          local type = tonumber(strs[1])
          table.insert(rewards, {
            id = id,
            count = count,
            type = type
          })
        end
      end
      return rewards
    end
  end
  return rewards
end

function DailyTaskData.GetHomeShowTask()
  if nil == taskList or #taskList <= 0 or not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
    return
  end
  local curTask
  for _, v in ipairs(taskList) do
    if v.task.state == ProtoEnum.TASK_STATE.NORMAL or v.task.state == ProtoEnum.TASK_STATE.FINISHED then
      if nil == curTask then
        curTask = v
      elseif v.task.state > curTask.task.state then
        curTask = v
      elseif v.task.state == curTask.task.state and v.index < curTask.index then
        curTask = v
      end
    end
  end
  if curTask then
    local taskConfig = TableData.GetConfig(curTask.task.taskId, "BaseTask")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = taskConfig.name(),
      value = curTask.task.value,
      targetValue = taskConfig.task_parameter[1]
    }
  end
  return
end

function DailyTaskData.ShowHomeDailyTarget()
  if RedDotTask.CanGrowTarget() then
    local taskConfig = TableData.GetConfig(ACTIVITY_ID.DAILY_TASK, "BaseActivity")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = T(80629605)
    }
  end
  if RedDotTask.CanDailyTarget() then
    local taskConfig = TableData.GetConfig(ACTIVITY_ID.DAILY_TASK, "BaseActivity")
    return {
      url = UIUtil.GetResUrl(taskConfig.home_icon),
      text = T(80629602)
    }
  end
end

function DailyTaskData.CanDailyTask()
  if nil == taskList or #taskList <= 0 then
    return
  end
  for _, v in ipairs(taskList) do
    if v.task.state == ProtoEnum.TASK_STATE.FINISHED then
      return true
    end
  end
end
