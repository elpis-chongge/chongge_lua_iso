RedDotSign = {}

function RedDotSign.HomeTaskRed(data)
  if data.type == SignTypeEnum.SIGN_IN_ACT then
    local reward = SignData.GetSignData(tonumber(data.parameter))
    local day = #reward or -1
    if SignData.activityData[data.id].isTodaySignIn == false and day > SignData.activityData[data.id].curDay and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
      return true
    end
  elseif data.type == SignTypeEnum.SEARCH_ACT and false == SignData.activityData[data.id].isTodaySearch and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
    return true
  end
end

function RedDotSign.HomeReservationRed(data)
  if data.gift_reward_ids then
    for i = 1, #data.gift_reward_ids do
      if ShopData.canRewards and table.contain(ShopData.canRewards, data.gift_reward_ids[i]) then
        return true
      end
    end
  end
end

function RedDotSign.HomeReturnGiftRed(data)
  if data then
    return data.returnDay > data.signDay
  end
end
