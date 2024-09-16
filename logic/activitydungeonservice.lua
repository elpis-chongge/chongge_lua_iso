ActivityDungeonService = {}

function ActivityDungeonService.Init()
  Net.AddListener(Proto.MsgName.GetActivityAllRsp, ActivityDungeonService.GetActivityAllRsp)
  Net.AddListener(Proto.MsgName.ActivityStageSignInRsp, ActivityDungeonService.ActivityStageSignInRsp)
  Net.AddListener(Proto.MsgName.ActivityStageShopBuyRsp, ActivityDungeonService.ActivityStageShopBuyRsp)
  Net.AddListener(Proto.MsgName.ActivityStageTaskRewardRsp, ActivityDungeonService.ActivityStageTaskRewardRsp)
end

function ActivityDungeonService.GetActivityAllReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.GetActivityAllReq, msg, rspCallBack)
end

function ActivityDungeonService.GetActivityAllRsp(msg)
  ActivityDungeonData.SaveActivityInfo(msg)
  SignData.SaveActivityData(msg)
  SignData.signInAct = msg.signInAct
  UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

function ActivityDungeonService.ActivityStageSignInReq(signDay, activityId, rspCallBack)
  local msg = {}
  msg.signDay = signDay
  msg.activityId = activityId
  Net.Send(Proto.MsgName.ActivityStageSignInReq, msg, rspCallBack)
end

function ActivityDungeonService.ActivityStageSignInRsp(msg)
  ActivityDungeonData.UpdateSignInfo(msg.signDay, msg.curDay)
  local newReward = ActivityDungeonMgr.MergeItemNum(msg.rewards)
  GetItemTips.Show(newReward)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

function ActivityDungeonService.ActivityStageShopBuyReq(buyCount, gridId, rspCallBack)
  local msg = {}
  msg.buyCount = buyCount
  msg.gridId = gridId
  Net.Send(Proto.MsgName.ActivityStageShopBuyReq, msg, rspCallBack)
end

function ActivityDungeonService.ActivityStageShopBuyRsp(msg)
  ActivityDungeonData.UpdateBoughtItem(msg.boughtItem)
  GetItemTips.Show(msg.rewards)
  UIMgr:SendWindowMessage(WinResConfig.ActivityShopWindow.name, WindowMsgEnum.ActivityDungeon.REFRESH_SHOP)
  UIMgr:SendWindowMessage(WinResConfig.Activity2ShopWindow.name, WindowMsgEnum.ActivityDungeon.REFRESH_SHOP)
  UIMgr:SendWindowMessage(WinResConfig.Activity3ShopWindow.name, WindowMsgEnum.ActivityDungeon.REFRESH_SHOP)
end

function ActivityDungeonService.ActivityStageTaskRewardReq(activityId, taskUid, rspCallBack)
  local msg = {}
  msg.activityId = activityId
  msg.taskUid = taskUid
  Net.Send(Proto.MsgName.ActivityStageTaskRewardReq, msg, rspCallBack)
end

function ActivityDungeonService.ActivityStageTaskRewardRsp(msg)
  for i, v in pairs(msg.changeTask) do
    ActivityDungeonData.UpdateOneTask(v)
  end
  local newReward = ActivityDungeonMgr.MergeItemNum(msg.rewards)
  GetItemTips.Show(newReward)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

ActivityDungeonService.Init()
