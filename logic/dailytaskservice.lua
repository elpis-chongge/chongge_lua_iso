DailyTaskService = {}

function DailyTaskService.Init()
  Net.AddListener(Proto.MsgName.GetCommonTaskInfoRsp, DailyTaskService.GetCommonTaskInfoRsp)
  Net.AddListener(Proto.MsgName.CommonTaskRewardRsp, DailyTaskService.CommonTaskRewardRsp)
  Net.AddListener(Proto.MsgName.CommonTaskReplaceRsp, DailyTaskService.CommonTaskReplaceRsp)
end

function DailyTaskService.GetCommonTaskInfoReq(rspCallback)
  local msg = {}
  msg.refreshStamp = DailyTaskData.GetRefreshStamp()
  Net.Send(Proto.MsgName.GetCommonTaskInfoReq, msg, rspCallback)
end

function DailyTaskService.GetCommonTaskInfoRsp(msg)
  DailyTaskData.UpdateTaskData(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
end

function DailyTaskService.CommonTaskRewardReq(rewardType, rewardId)
  local msg = {}
  msg.rewardType = rewardType
  msg.rewardId = rewardId
  DailyTaskData.lastLv = ActorData.GetLevel()
  Net.Send(Proto.MsgName.CommonTaskRewardReq, msg)
end

function DailyTaskService.CommonTaskRewardRsp(msg)
  DailyTaskData.UpdateTaskReward(msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end

function DailyTaskService.CommonTaskReplaceReq(index)
  local msg = {}
  msg.index = index
  msg.refreshStamp = DailyTaskData.GetRefreshStamp()
  Net.Send(Proto.MsgName.CommonTaskReplaceReq, msg, function()
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE, {index})
  end)
end

function DailyTaskService.CommonTaskReplaceRsp(msg)
  DailyTaskData.UpdateTaskReplace(msg)
end

DailyTaskService.Init()
