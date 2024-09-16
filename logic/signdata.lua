SignData = {
  activityData = {},
  showAct = {}
}
SignTypeEnum = {
  SIGN_IN_ACT = 10118,
  STAGE_ACT = 10119,
  SEARCH_ACT = 10123,
  RETURN_ACT = 10132
}

function SignData.SaveActivityData(msg)
  for i, v in pairs(msg) do
    if "showAct" ~= i then
      if "returnAct" == i then
        if v.baseInfo and v.baseInfo.activityId then
          SignData.activityData[v.baseInfo.activityId] = v
        else
          SignData.activityData[v.baseInfo.activityId] = nil
        end
      else
        for ii, vv in pairs(v) do
          if vv.baseInfo.activityId then
            SignData.activityData[vv.baseInfo.activityId] = vv
          end
        end
      end
    end
  end
end

function SignData.UpdateOneActivityData(data)
  if SignData.activityData and data then
    for i, v in pairs(SignData.activityData) do
      if v.baseInfo.activityId == data.baseInfo.activityId then
        SignData.activityData[v.baseInfo.activityId] = data
      end
    end
  end
end

function SignData.GetActivitySignInData()
  local config = {}
  local parType
  for i, v in pairs(SignData.activityData) do
    local data = TableData.GetConfig(v.baseInfo.activityId, "BaseActivity")
    if v.activityCheckInType then
      if v.returnDay and v.returnDay > 0 and v.baseInfo.endStamp > LoginData.GetCurServerTime() then
        local allDay = SignData.GetSignData(v.activityCheckInType)
        if allDay and v.signDay < #allDay then
          SignData.returnMaxDay = #allDay
          table.insert(config, data)
        end
      end
    else
      parType = tonumber(data.parameter)
      if parType and 10 == parType then
      elseif data and data.type ~= SignTypeEnum.STAGE_ACT then
        table.insert(config, data)
      end
    end
  end
  if #config > 1 then
    table.sort(config, function(a, b)
      if a.sort and b.sort then
        return a.sort < b.sort
      end
    end)
  end
  return config
end

function SignData.GetSignData(type)
  local config = TableData.GetTable("BaseActivityCheckIn")
  local tb = {}
  for i, v in pairs(config) do
    if v.type == type then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.day < b.day
  end)
  return tb
end

function SignData.GetReservationData()
  local config = TableData.GetTable("BaseGift")
  for i, v in pairs(config) do
    if 4 == v.type then
      return v
    end
  end
end

function SignData.CanShowReservation()
  local data = SignData.GetReservationData()
  if data and ShopData and data and data.gift_reward_ids then
    local info = ShopData.GetGiftInfoById(data.id)
    if info and #info.rewards ~= #data.gift_reward_ids then
      return true, data
    end
  end
  return false
end
