local COMPARE_RESULT = {
  EQUAL = 0,
  LESS = -1,
  GREATER = 1
}
local CompareWithServerStamp = function(hour, minutes)
  local timestamp = math.ceil(LoginData.GetCurServerTime())
  local h = tonumber(TimeUtil.FormatDate("%H", timestamp))
  local m = tonumber(TimeUtil.FormatDate("%M", timestamp))
  if hour < h then
    return COMPARE_RESULT.LESS
  elseif hour > h then
    return COMPARE_RESULT.GREATER
  end
  if minutes > m then
    return COMPARE_RESULT.GREATER
  elseif minutes < m then
    return COMPARE_RESULT.LESS
  end
  return COMPARE_RESULT.EQUAL
end
local IsOverdue = function(rewardId)
  local conf = TableData.GetConfig(rewardId, "BaseActivityVitGet")
  local result = false
  if conf.time then
    for i, v in pairs(conf.time) do
      local splits = Split(v, ":")
      local starttime, cutofftime = tonumber(splits[1]), tonumber(splits[2])
      local cutofftime_result = CompareWithServerStamp(cutofftime / 100, cutofftime % 100)
      result = result or cutofftime_result == COMPARE_RESULT.LESS
    end
  end
  return result
end
local AlreadyGot = function(rewardId)
  local supplies = DailySupplyData.GetSupplies()
  if supplies then
    return table.keyof(supplies, rewardId)
  end
  return false
end
local InTime = function(rewardId)
  local conf = TableData.GetConfig(rewardId, "BaseActivityVitGet")
  local result = false
  if conf.time then
    for _, v in ipairs(conf.time) do
      local splits = Split(v, ":")
      local starttime, cutofftime = tonumber(splits[1]), tonumber(splits[2])
      local starttime_result = CompareWithServerStamp(starttime / 100, starttime % 100)
      local cutofftime_result = CompareWithServerStamp(cutofftime / 100, cutofftime % 100)
      result = result or starttime_result ~= COMPARE_RESULT.GREATER and cutofftime_result == COMPARE_RESULT.GREATER
    end
  end
  return result
end
local HasAnyInTimeSupply = function()
  local configTbl = TableData.GetTable("BaseActivityVitGet")
  for k, v in pairs(configTbl) do
    if DailySupplyMgr.InTime(v.id) and not DailySupplyMgr.AlreadyGot(v.id) then
      return true
    end
  end
  return false
end
local HasAnyRedeemableSupply = function()
  local configTbl = TableData.GetTable("BaseActivityVitGet")
  for k, v in pairs(configTbl) do
    if not DailySupplyMgr.AlreadyGot(v.id) then
      return true
    end
  end
  return false
end
local GetTotalSupplies = function()
  local result = 0
  local configTbl = TableData.GetTable("BaseActivityVitGet")
  for k, v in pairs(configTbl) do
    if InTime(v.id) and not AlreadyGot(v.id) then
      result = result + tonumber(Split(v.reward[1], ":")[3])
    end
  end
  return result
end
return {
  InTime = InTime,
  IsOverdue = IsOverdue,
  AlreadyGot = AlreadyGot,
  HasAnyInTimeSupply = HasAnyInTimeSupply,
  HasAnyRedeemableSupply = HasAnyRedeemableSupply,
  GetTotalSupplies = GetTotalSupplies
}
