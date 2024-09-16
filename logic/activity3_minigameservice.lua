Activity3_MiniGameService = {}

function Activity3_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {activityId = activityId}, rspCallback)
end

function Activity3_MiniGameService.MiniGameInfoRsp(msg)
  Activity3_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity3MiniGameMainWindow.name, WindowMsgEnum.Activity3_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity3_MiniGameService.MiniGameSubmitReq(map, point, seconds, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  local stamp = math.floor(LoginData.GetCurServerTime())
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    activityId = activityId,
    playSec = seconds,
    records = {
      counts = map,
      point = point,
      stamp = stamp
    }
  }, rspCallback, OnSubmitErrCallback)
end

function Activity3_MiniGameService.MiniGameSubmitRsp(msg)
  Activity3_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity3MiniGameWindow.name, WindowMsgEnum.Activity3_MiniGame.RESET)
  end)
end

function Activity3_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {activityId = activityId})
end

function Activity3_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity3_MiniGameService.MiniGameInfoReq()
end

function Activity3_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity3_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity3_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity3_MiniGameService.MiniGameGetDailyRewardRsp)
end

Activity3_MiniGameService.Init()
