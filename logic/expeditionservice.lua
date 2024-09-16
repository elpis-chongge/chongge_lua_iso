local GetExpeditionInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetExpeditionInfoReq, nil, rspCallback)
end
local GetExpeditionInfoRsp = function(msg)
  local data_refresh = false
  local curData = ExpeditionData.GetData()
  if curData then
    local curNextRefreshTimestamp = curData.nextRefreshStamp
    if curNextRefreshTimestamp ~= msg.nextRefreshStamp then
      data_refresh = true
    end
  end
  ExpeditionData.SetData(msg)
  ExpeditionMgr.data_refresh = data_refresh
  if data_refresh and (UIMgr:IsWindowOpen(WinResConfig.ExpeditionBattleChoiceWindow.name) or UIMgr:IsWindowOpen(WinResConfig.ExpeditionBattleReviewWindow.name) or UIMgr:IsWindowOpen(WinResConfig.ExpeditionRewardWindow.name)) then
    OpenWindow(WinResConfig.ExpeditionWindow.name)
  end
  UIMgr:SendWindowMessage(WinResConfig.ExpeditionWindow.name, WindowMsgEnum.ExpeditionWindow.INIT_INFO, data_refresh)
  UIMgr:SendWindowMessage(WinResConfig.ExpeditionRewardWindow.name, WindowMsgEnum.ExpeditionRewardWindow.REFRESH_REWARDS_INFO, data_refresh)
end
local reward_req = {}
local GetExpeditionRewardReq = function(rewardId)
  reward_req.rewardId = rewardId
  Net.Send(Proto.MsgName.GetExpeditionRewardReq, reward_req)
end
local GetExpeditionRewardRsp = function(msg)
  local goods = msg.goods
  GetItemTips.Show(goods)
  ExpeditionData.SetRewardsInfo(msg.rewards)
  UIMgr:SendWindowMessage(WinResConfig.ExpeditionRewardWindow.name, WindowMsgEnum.ExpeditionRewardWindow.REFRESH_REWARDS_INFO)
  UIMgr:SendWindowMessage(WinResConfig.SimpleExpeditionRewardWindow.name, WindowMsgEnum.SimpleExpeditionRewardWindow.REFRESH_REWARDS_INFO)
end
local GetBattleRecordReq = function(uid, callback)
  if not BattleService then
    ld("Battle", function()
      BattleService.GetBattleRecordReq(uid, callback)
    end)
  else
    BattleService.GetBattleRecordReq(uid, callback)
  end
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetExpeditionInfoRsp, GetExpeditionInfoRsp)
  Net.AddListener(Proto.MsgName.GetExpeditionRewardRsp, GetExpeditionRewardRsp)
end
return {
  Init = Init,
  GetBattleRecordReq = GetBattleRecordReq,
  GetExpeditionInfoReq = GetExpeditionInfoReq,
  GetExpeditionRewardReq = GetExpeditionRewardReq
}
