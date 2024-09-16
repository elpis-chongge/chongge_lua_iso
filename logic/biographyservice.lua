BiographyService = {}

function BiographyService.Init()
  Net.AddListener(Proto.MsgName.GetPlantInfoRsp, BiographyService.GetPlantInfoRsp)
  Net.AddListener(Proto.MsgName.RewardFlowerRsp, BiographyService.RewardFlowerRsp)
  Net.AddListener(Proto.MsgName.RewardPlantTaskRsp, BiographyService.RewardPlantTaskRsp)
end

function BiographyService.GetPlantInfoReq(rspCallback)
  local msg = {}
  msg.refreshStamp = BiographyData.GetRefreshStamp()
  Net.Send(Proto.MsgName.GetPlantInfoReq, msg, rspCallback)
end

function BiographyService.GetPlantInfoRsp(msg)
  BiographyData.plantInfo = msg
  BiographyData.RefreshRefreshStamp(msg.refreshStamp)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.BIOGRAHY)
end

function BiographyService.RewardFlowerReq(plantId, flowerId)
  local msg = {}
  msg.plantId = plantId
  msg.flowerId = flowerId
  Net.Send(Proto.MsgName.RewardFlowerReq, msg)
end

function BiographyService.RewardFlowerRsp(msg)
  BiographyData.plantInfo.plantList = msg.plantList
  UIMgr:SendWindowMessage(WinResConfig.CarnivalWindow.name, WindowMsgEnum.CarnivalWindow.GET_FLOWER)
  LeanTween.delayedCall(0.2, function()
    GetItemTips.Show(msg.rewards)
  end)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end

function BiographyService.RewardPlantTaskReq(taskUid)
  local msg = {}
  msg.taskUid = taskUid
  Net.Send(Proto.MsgName.RewardPlantTaskReq, msg)
end

function BiographyService.RewardPlantTaskRsp(msg)
  GetItemTips.Show(msg.rewards)
  BiographyData.plantInfo.dailyTask.state = ProtoEnum.TASK_STATE.REWARD
  UIMgr:SendWindowMessage(WinResConfig.CarnivalWindow.name, WindowMsgEnum.CarnivalWindow.GET_FLOWER_TASK)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end

BiographyService.Init()
