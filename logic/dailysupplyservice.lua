local GetSupplyInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetSupplyInfoReq, nil, rspCallback)
end
local OnGetSupplyInfoRsp = function(msg)
  DailySupplyData.Clear()
  DailySupplyData.AddSupplies(msg.rewarded)
end
local reward_supply_msg = {}
local RewardSupplyReq = function(rewardId, redeem, rspCallback)
  reward_supply_msg.rewardId = rewardId
  reward_supply_msg.isRedeem = redeem or false
  Net.Send(Proto.MsgName.RewardSupplyReq, reward_supply_msg, rspCallback)
end
local OnRewardSupplyRsp = function(msg)
  local reward = msg.reward
  GetItemTips.Show(reward)
  DailySupplyData.AddSupplies(msg.rewarded)
end
local Init = function()
  Net.AddListener(Proto.MsgName.RewardSupplyRsp, OnRewardSupplyRsp)
  Net.AddListener(Proto.MsgName.GetSupplyInfoRsp, OnGetSupplyInfoRsp)
end
return {
  Init = Init,
  RewardSupplyReq = RewardSupplyReq,
  GetSupplyInfoReq = GetSupplyInfoReq
}
