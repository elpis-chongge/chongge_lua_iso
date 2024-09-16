RedDotGacha = {}

function RedDotGacha.ShowHome()
  if LotteryData and LotteryData.Info and LotteryData.Info.openList then
    for i, v in pairs(LotteryData.Info.openList) do
      local data = TableData.GetConfig(i, "BaseGacha")
      if data and RedDotGacha.CanFreeCoupon(data) then
        return true
      end
    end
  end
  return false
end

local GetCost = function(cost)
  local tb = {}
  for i, v in pairs(cost) do
    local arr = Split(v, ":")
    if 3 == #arr then
      tb[tonumber(arr[2])] = tonumber(arr[3])
    end
  end
  return tb
end

function RedDotGacha.CanFreeCoupon(data)
  if data then
    for i, v in pairs(data.title_show) do
      for _, vv in pairs(data.gacha_mode) do
        local modeData = TableData.GetConfig(vv, "BaseGachaMode")
        if -1 ~= modeData.day_limit_num and LotteryData.Info.dailyGachaCount and LotteryData.Info.dailyGachaCount[modeData.id] and LotteryData.Info.dailyGachaCount[modeData.id] >= modeData.max_num then
          return false
        end
        if -1 ~= modeData.max_num and LotteryData.Info.totalGachaCount and LotteryData.Info.totalGachaCount[modeData.id] and LotteryData.Info.totalGachaCount[modeData.id] >= modeData.max_num then
          return false
        end
        if 10 == modeData.gacha_time and LevelIsWithTheRange(70011116) then
          if LotteryData.Info.dailyFreeCount[vv] and LotteryData.Info.dailyFreeCount[vv] > 0 then
            return true
          end
          local cost = GetCost(modeData.cost)
          if cost[v] and ActorData.GetItemCount(v) >= cost[v] then
            return true
          end
        elseif LevelIsWithTheRange(70011109) then
          if LotteryData.Info.dailyFreeCount[vv] and LotteryData.Info.dailyFreeCount[vv] > 0 then
            return true
          end
          local cost = GetCost(modeData.cost)
          if v ~= COMMON_ITEM_ID.RECHARGE_DIAMOND and cost[v] and ActorData.GetItemCount(v) >= cost[v] then
            return true
          end
        end
      end
    end
  end
  return false
end
