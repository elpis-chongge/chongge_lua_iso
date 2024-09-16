LotteryData = {
  Info = {},
  curPage = 0,
  drops = {},
  curPoolId = 0,
  showReview = false
}

function LotteryData.IsOpenById(id)
  if id and LotteryData.Info.openList then
    return LotteryData.Info.openList[id]
  end
end

function LotteryData.GetTpById(id)
  if LotteryData.Info.poolList and #LotteryData.Info.poolList > 0 then
    for i, v in pairs(LotteryData.Info.poolList) do
      if v.poolId == id then
        return v.point
      end
    end
  end
  return 0
end

function LotteryData.GetGachaPool(id)
  if LotteryData.Info.poolList and #LotteryData.Info.poolList > 0 then
    for i, v in pairs(LotteryData.Info.poolList) do
      if v.poolId == id then
        return v
      end
    end
  end
end

function LotteryData.GetExchangeNumById(poolId, itemId)
  if LotteryData.Info.poolList and #LotteryData.Info.poolList > 0 then
    for i, v in pairs(LotteryData.Info.poolList) do
      if v.poolId == poolId and v.exchangeList[itemId] then
        return v.exchangeList[itemId]
      end
    end
  end
  return 0
end

function LotteryData.SavePoint(poolInfo)
  if LotteryData.Info.poolList == nil or #LotteryData.Info.poolList < 1 then
    LotteryData.Info.poolList = {}
    table.insert(LotteryData.Info.poolList, poolInfo)
  else
    for i, v in pairs(LotteryData.Info.poolList) do
      if v.poolId == poolInfo.poolId then
        LotteryData.Info.poolList[i] = poolInfo
        break
      else
        table.insert(LotteryData.Info.poolList, poolInfo)
      end
    end
  end
end
