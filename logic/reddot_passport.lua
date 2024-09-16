RedDotPassport = {}

function RedDotPassport.ShowHome()
  return RedDotPassport.CanTask() or RedDotPassport.CanReward()
end

function RedDotPassport.DailyTaskComplete()
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
      if data and data.level_max > v.lv and 1 == data.group_id then
        for i, vv in pairs(v.dailyTask) do
          if vv.state == ProtoEnum.TASK_STATE.FINISHED then
            return true
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.WeeklyTaskComplete()
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
      if data and data.level_max > v.lv and 1 == data.group_id then
        for i, vv in pairs(v.weeklyTask) do
          if vv.state == ProtoEnum.TASK_STATE.FINISHED then
            return true
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.TotalTaskComplete()
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
      if data and data.level_max > v.lv and 1 == data.group_id then
        for i, vv in pairs(v.totalTask) do
          if vv.state == ProtoEnum.TASK_STATE.FINISHED then
            return true
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.TaskComplete(TaskData)
  for i, vv in pairs(TaskData) do
    if vv.state == ProtoEnum.TASK_STATE.FINISHED then
      return true
    end
  end
  return false
end

function RedDotPassport.CanReward()
  if PassportData then
    PassportData.GetPassport()
    if PassportData.info then
      local GetReward = function(passId)
        for _, vv in pairs(PassportData.info.rewards) do
          if vv.passId == passId then
            return vv
          end
        end
      end
      for i, v in pairs(PassportData.info.openList) do
        local info = GetReward(v)
        if nil == info or table.getLen(info.rewardLvs) <= PassportData.info.lv then
          return true
        end
      end
    end
  end
end

function RedDotPassport.CanTask()
  return RedDotPassport.DailyTaskComplete() or RedDotPassport.WeeklyTaskComplete() or RedDotPassport.TotalTaskComplete()
end
