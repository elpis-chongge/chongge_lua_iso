PassportData = {index = 0}
PassportData.infoArr = nil
PassportData.info = nil
PassportData.activityinfo = nil

function PassportData.GetRewardDataByPhaseId(phaseId)
  local data = {}
  local tb = {}
  local config = TableData.GetTable("BaseBattlePassReward")
  for i, v in pairs(config) do
    if v.pass_id == phaseId then
      table.insert(data, v)
      if v.reward_type then
        table.insert(tb, v.level)
      end
    end
  end
  table.sort(data, function(a, b)
    return a.level < b.level
  end)
  table.sort(tb, function(a, b)
    return a < b
  end)
  return data, tb
end

function PassportData.GetNextExpDataByPhaseId(type, lv)
  local config = TableData.GetTable("BaseBattlePassLevel")
  for i, v in pairs(config) do
    if v.type == type and v.level == lv then
      return v
    end
  end
end

function PassportData.GetPassInfo(id)
  for i, v in pairs(PassportData.infoArr) do
    if v.passPortId == id then
      return PassportData.infoArr[i]
    end
  end
end

function PassportData.GetNextPassport(group)
  local groupId = group or 1
  local curTime = LoginData.GetCurServerTime()
  for i, v in pairs(PassportData.infoArr) do
    local config = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
    if config.group_id == groupId and v.endStamp - curTime > 60 then
      return v.passPortId
    end
  end
end

function PassportData.GetPassport()
  if PassportData.infoArr then
    for i, v in pairs(PassportData.infoArr) do
      local config = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
      if 1 == config.group_id then
        PassportData.info = PassportData.infoArr[i]
        break
      end
    end
  end
end

local GetActivityPassId = function(showId)
  local config = TableData.GetTable("BaseActivityStageConfig")
  for i, v in pairs(config) do
    if showId == v.show_id then
      return v.pass_port_id
    end
  end
end

function PassportData.GetActivityPassport(showId)
  local curShowId = showId or ActivityDungeonData.GetShowId()
  local passId = GetActivityPassId(curShowId)
  if PassportData.infoArr and passId then
    for i, v in pairs(PassportData.infoArr) do
      local config = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
      if 2 == config.group_id and passId == v.passPortId then
        return PassportData.infoArr[i]
      end
    end
  end
end
