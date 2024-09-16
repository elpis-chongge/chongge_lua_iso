local MiniGameInfoReq = function(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {activityId = activityId}, rspCallback)
end
local MiniGameInfoRsp = function(msg)
  Activity1_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.ActivityMiniGameMainWindow.name, WindowMsgEnum.Activity1_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end
local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end
local MiniGameSubmitReq = function(map, point, seconds, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    activityId = activityId,
    playSec = seconds,
    records = {
      counts = map,
      point = point,
      stamp = 0
    }
  }, rspCallback, OnSubmitErrCallback)
end
local MiniGameSubmitRsp = function(msg)
  MiniGameInfoReq()
end
local MiniGameGetDailyRewardReq = function()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {activityId = activityId})
end
local MiniGameGetDailyRewardRsp = function(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  MiniGameInfoReq()
end
local Init = function()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, MiniGameGetDailyRewardRsp)
end
Init()
return {
  MiniGameInfoReq = MiniGameInfoReq,
  MiniGameSubmitReq = MiniGameSubmitReq,
  MiniGameGetDailyRewardReq = MiniGameGetDailyRewardReq
}
