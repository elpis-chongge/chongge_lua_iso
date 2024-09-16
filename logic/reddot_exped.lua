RedDotExped = {}

function RedDotExped.Init()
end

function RedDotExped.HasAnyRewards()
  local expedData = ExpeditionData.GetData()
  local gotRewards = ExpeditionData.GetRewardsInfo()
  local numStars = expedData.highPassStar or 0
  local rewardTbl = TableData.GetTable("BaseExpeditionReward")
  for _, conf in pairs(rewardTbl) do
    local got = false
    if table.contain(gotRewards, conf.id) then
      got = true
    end
    local points = type(conf.unlock_points) == "number" and conf.unlock_points or 0
    local lock = numStars < points
    if not got and not lock then
      return true
    end
  end
  return false
end
