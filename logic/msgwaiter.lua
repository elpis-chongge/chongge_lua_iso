local MsgWaiterObj = {
  TIMEOUT_TIME = 15,
  RESEND_INTERVAL_LIST = {
    5,
    3,
    3
  },
  RESEND_MAX_COUNT = 3,
  waitMsgTable = {},
  sequenceMap = {}
}
local MSG_DEAL_STATE = {NOT_DEAL = 0, ALREADY_DEAL = 1}
local _confirmMarker = "MsgWaiterConfirmWin"

function MsgWaiter(waitMsgName, sendMsgName, timeoutCallback, sequence, rspCallback, errorCallback)
  local sequenceInfo = MsgWaiterObj.sequenceMap[sequence]
  if nil == sequenceInfo then
    MsgWaiterObj.sequenceMap[sequence] = MSG_DEAL_STATE.NOT_DEAL
    MsgWaiterObj.waitMsgTable[#MsgWaiterObj.waitMsgTable + 1] = {
      resendCount = 0,
      sendTime = LoginData.GetCurServerTime(),
      sequence = sequence,
      sendMsgName = sendMsgName,
      waitMsgName = waitMsgName,
      timeoutCallback = timeoutCallback,
      rspCallback = rspCallback,
      errorCallback = errorCallback
    }
  elseif sequenceInfo == MSG_DEAL_STATE.ALREADY_DEAL then
    return
  end
  MsgWaiterObj.ShowWaitingWindow()
end

function MsgWaiterObj.TryResendMsg()
  if Net.IsConnect() == false then
    return
  end
  local waitMsgTable = MsgWaiterObj.waitMsgTable
  if #waitMsgTable <= 0 then
    return
  end
  if #waitMsgTable > 1 then
    table.sort(waitMsgTable, function(a, b)
      return a.sequence < b.sequence
    end)
  end
  for _, msgInfo in ipairs(waitMsgTable) do
    local sendTime = msgInfo.sendTime
    local interval = MsgWaiterObj.RESEND_INTERVAL_LIST[msgInfo.resendCount + 1] or MsgWaiterObj.RESEND_INTERVAL_LIST[#MsgWaiterObj.RESEND_INTERVAL_LIST]
    if interval <= LoginData.GetCurServerTime() - sendTime then
      if msgInfo.resendCount >= MsgWaiterObj.RESEND_MAX_COUNT then
        Net.reconnectEnable = false
        Net.resendEnable = false
        MsgWaiterObj.HideWaitingWindow()
        MessageBox.Show(T(10643), {
          titleText = T(10645),
          touchCallback = function()
            Net.reconnectEnable = true
            MsgWaiterObj.ResetAllMsgResendInfo()
            MsgWaiterObj.ShowWaitingWindow()
          end
        }, {
          titleText = T(10644),
          touchCallback = function()
            LoginMgr.ReturnToLogin()
          end
        }, {touchable = false}, nil, UILayer.NetCheck)
        return
      end
      msgInfo.sendTime = LoginData.GetCurServerTime()
      msgInfo.resendCount = msgInfo.resendCount + 1
      print("重发消息 消息号", msgInfo.sequence, "消息名", msgInfo.sendMsgName, "重发次数：", msgInfo.resendCount)
      msgInfo.timeoutCallback()
    end
  end
end

function MsgWaiterObj.ResetAllMsgResendInfo()
  local waitMsgTable = MsgWaiterObj.waitMsgTable
  if #waitMsgTable <= 0 then
    return
  end
  for _, msgInfo in ipairs(waitMsgTable) do
    msgInfo.resendCount = 0
    msgInfo.sendTime = LoginData.GetCurServerTime()
  end
end

function MsgWaiterObj.ResendAllTimeoutMsg()
  local waitMsgTable = MsgWaiterObj.waitMsgTable
  for _, msgInfo in ipairs(waitMsgTable) do
    msgInfo.timeoutCallback()
  end
end

function MsgWaiterObj.ReceiveMsg(MsgId, sequence, retCode)
  if MsgWaiterObj.sequenceMap[sequence] == MSG_DEAL_STATE.ALREADY_DEAL then
    return true
  end
  if MsgWaiterObj.sequenceMap[sequence] == MSG_DEAL_STATE.NOT_DEAL then
    MsgWaiterObj.sequenceMap[sequence] = MSG_DEAL_STATE.ALREADY_DEAL
  end
  local errorCallback, rspCallback, msgCompleteCallBack
  local waitMsgTable = MsgWaiterObj.waitMsgTable
  for i, msgInfo in ipairs(waitMsgTable) do
    if msgInfo.sequence == sequence then
      rspCallback = msgInfo.rspCallback
      errorCallback = msgInfo.errorCallback
      table.remove(waitMsgTable, i)
    end
  end
  local msgName = Proto.MsgNameByID[MsgId]
  local loadProgressTable = ActorMgr.loadProgressTable
  if loadProgressTable and #loadProgressTable > 0 then
    for i, v in ipairs(loadProgressTable) do
      if v.name == msgName then
        if retCode ~= ProtoEnum.RET_CODE.RC_OK then
          LoginMgr.ReturnToLogin()
          return
        end
        table.remove(loadProgressTable, i)
        break
      end
    end
    if #loadProgressTable <= 0 then
      msgCompleteCallBack = ActorMgr.msgCompleteCallBack
      ActorMgr.msgCompleteCallBack = nil
      ActorMgr.necessaryInfoSuccess = true
    end
  end
  if #waitMsgTable <= 0 then
    MsgWaiterObj.Reset()
  end
  return false, rspCallback, errorCallback, msgCompleteCallBack
end

function MsgWaiterObj.Reset()
  MsgWaiterObj.ClearCheckTimer()
end

function MsgWaiterObj.ClearCheckTimer()
  MsgWaiterObj.HideWaitingWindow()
end

function MsgWaiterObj.Reconnect()
  MsgWaiterObj.ShowWaitingWindow()
  Net.ReConnect()
end

function MsgWaiterObj.Destroy()
  MsgWaiterObj.Reset()
  MsgWaiterObj.waitMsgTable = {}
  MsgWaiterObj.sequenceMap = {}
end

function MsgWaiterObj.ShowWaitingWindow(rightNow)
  if UIMgr:IsWindowOpen(WinResConfig.NetCheckWindow.name) == false then
    OpenWindow(WinResConfig.NetCheckWindow.name, UILayer.NetCheck)
  end
  if rightNow then
    UIMgr:SendWindowMessage(WinResConfig.NetCheckWindow.name, WindowMsgEnum.NetCheckWindow.E_MSG_FORCE_SHOW)
  end
end

function MsgWaiterObj.HideWaitingWindow()
  UIMgr:HideWindow(WinResConfig.NetCheckWindow.name)
end

return MsgWaiterObj
