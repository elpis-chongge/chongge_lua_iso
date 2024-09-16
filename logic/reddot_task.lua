RedDotTask = {}

function RedDotTask.HomeTaskRed()
  return CarnivalData.SignIsShowHome() or CarnivalData.BiographyShowHome() or RedDotTask.InitialCarnivalRed() or RedDotTask.InitialSignRed() or RedDotTask.DailyTaskRed() or RedDotTask.BiographyRed() or RedDotTask.CanLvGift() or RedDotTask.HasAnySupplies()
end

function RedDotTask.InitialCarnivalRed()
  return RedDotTask.CanCarnivalTarget() or RedDotTask.CanCarnivalTask()
end

function RedDotTask.CanCarnivalTask()
  local taskInfo = CarnivalData.GetHomeShowTask()
  if taskInfo and taskInfo.value >= taskInfo.targetValue then
    return true
  end
  return false
end

function RedDotTask.CanCarnivalTarget()
  if not CarnivalData.CarnivalIsUnlock() then
    return false
  end
  local targetData = CarnivalData.GetCarnivalTargetData()
  if #CarnivalData.info.rewardTragets >= #targetData then
    return false
  end
  local integralNum = ActorData.GetItemCount(COMMON_ITEM_ID.INTEGRAL)
  local arr
  for i, v in ipairs(targetData) do
    arr = GetConfigItemList(v.unlock_points, true)
    if arr[1] and integralNum >= arr[1].value and not table.contain(CarnivalData.info.rewardTragets, v.id) then
      return true
    end
  end
  return false
end

function RedDotTask.CanDayTask(id)
  if not CarnivalData.CarnivalIsUnlock() then
    return false
  end
  for i, v in pairs(CarnivalData.info.stageList) do
    if v.stageId == id then
      for j = 1, #v.taskList do
        if v.taskList[j].state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
  return false
end

function RedDotTask.InitialSignRed()
  return RedDotTask.CanInitialSign()
end

function RedDotTask.CanInitialSign()
  if not CarnivalData.InitialSignIsUnlock() then
    return false
  end
  local signData = SignData.activityData[ACTIVITY_ID.INITIAL_SIGN]
  if signData and signData.isTodaySignIn == false then
    return true
  end
  return false
end

function RedDotTask.DailyTaskRed()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
    return RedDotTask.CanDailyTask() or RedDotTask.CanGrowTarget() or RedDotTask.CanDailyTarget()
  end
  return false
end

function RedDotTask.CanDailyTask()
  local taskInfo = DailyTaskData.GetHomeShowTask()
  if taskInfo and taskInfo.value >= taskInfo.targetValue then
    return true
  end
  return false
end

function RedDotTask.CanGrowTarget()
  local config, isReach, isGot = DailyTaskData.GetGrowShow()
  return isReach and false == isGot
end

function RedDotTask.CanDailyTarget()
  local curDailyItem = DailyTaskData.GetDailyItem()
  local dailyRewardList = DailyTaskData.GetDailyReward()
  for i, v in ipairs(dailyRewardList) do
    if v.isGot == false and curDailyItem >= v.config.unlock_points then
      return true
    end
  end
end

function RedDotTask.BiographyRed()
  return RedDotTask.CanBiographyFlower() or RedDotTask.CanBiographyTask()
end

function RedDotTask.CanBiographyTask()
  if not CarnivalData.BiographyIsUnlock() then
    return false
  end
  local curTask = BiographyData.plantInfo.dailyTask
  if curTask and curTask.state == ProtoEnum.TASK_STATE.FINISHED then
    return true
  end
  return false
end

function RedDotTask.CanBiographyFlower()
  if not CarnivalData.BiographyIsUnlock() then
    return false
  end
  if BiographyData.plantInfo.plantList then
    for _, v in pairs(BiographyData.plantInfo.plantList) do
      for ii, vv in pairs(v.flowers) do
        if vv == ProtoEnum.FLOWER_STATE.FS_OPEN then
          return true
        end
      end
    end
  end
  return false
end

function RedDotTask.CanLvGift()
  if not CarnivalData.LvGiftIsUnlock() then
    return false
  end
  local data = CarnivalData.GetLvGiftData()
  if data and data.gift_reward_ids then
    local giftInfo = ShopData.GetGiftInfoById(data.id)
    if giftInfo then
      for i = 1, #data.gift_reward_ids do
        if not table.contain(giftInfo.rewards, data.gift_reward_ids[i]) then
          local rewardLvData = TableData.GetConfig(data.gift_reward_ids[i], "BaseGiftReward")
          local arr = GetConfigItemList(rewardLvData.condition)
          local lv = ActorData.GetLevel()
          if arr[CONDITION_ENUM.LV] and lv and arr[CONDITION_ENUM.LV].value then
            return lv >= arr[CONDITION_ENUM.LV].value
          end
        end
      end
    end
  end
end

function RedDotTask.HasAnySupplies()
  return DailySupplyMgr.HasAnyInTimeSupply()
end
