PassportService = {}

function PassportService.Init()
  Net.AddListener(Proto.MsgName.GetBattlePassInfoRsp, PassportService.GetBattlePassInfoRsp)
  Net.AddListener(Proto.MsgName.BattlePassGetRewardRsp, PassportService.BattlePassGetRewardRsp)
  Net.AddListener(Proto.MsgName.BattlePassTaskRewardRsp, PassportService.BattlePassTaskRewardRsp)
  Net.AddListener(Proto.MsgName.BattlePassBuyLevelRsp, PassportService.BattlePassBuyLevelRsp)
end

function PassportService.GetBattlePassInfoReq(rspCallback)
  Net.Send(Proto.MsgName.GetBattlePassInfoReq, {}, rspCallback)
end

function PassportService.GetBattlePassInfoRsp(msg)
  PassportData.infoArr = msg.info
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.PASSPORT)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

function PassportService.BattlePassGetRewardReq(phaseId, passId, rewardLv, rewardAll, rspCallback, errorCallback)
  local msg = {}
  msg.phaseId = phaseId
  msg.passId = passId
  msg.rewardLv = rewardLv
  msg.rewardAll = rewardAll
  Net.Send(Proto.MsgName.BattlePassGetRewardReq, msg, rspCallback, errorCallback)
end

function PassportService.BattlePassGetRewardRsp(msg)
  for i, v in pairs(PassportData.infoArr) do
    if v.passPortId == msg.info.passPortId then
      PassportData.infoArr[i] = msg.info
    end
  end
end

function PassportService.BattlePassTaskRewardReq(phaseId, taskUid, rspCallback, errorCallback)
  local msg = {}
  msg.phaseId = phaseId
  msg.taskUid = taskUid
  Net.Send(Proto.MsgName.BattlePassTaskRewardReq, msg, rspCallback, errorCallback)
end

function PassportService.BattlePassTaskRewardRsp(msg)
  if msg.info then
    for i, v in pairs(PassportData.infoArr) do
      if v.passPortId == msg.info.passPortId then
        PassportData.infoArr[i] = msg.info
      end
    end
  end
end

function PassportService.BattlePassBuyLevelReq(phaseId, buyLevel, rspCallback)
  local msg = {}
  msg.phaseId = phaseId
  msg.buyLevel = buyLevel
  Net.Send(Proto.MsgName.BattlePassBuyLevelReq, msg, rspCallback)
end

function PassportService.BattlePassBuyLevelRsp(msg)
end

PassportService.Init()
