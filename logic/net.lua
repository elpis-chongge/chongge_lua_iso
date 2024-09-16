local require = require
local pb = require("pb")
local protoc = require("Protoc")
Proto = require("Proto")
pb.option("enum_as_value")
pb.option("use_default_values")
assert(protoc:load(Proto.Schema))
local ErrorCode = require("ErrorCode")
require("Handler")
local SocketMgr = CS.LuaSocketManager.Singleton
local Net = {
  msgSequence = 1,
  defaultConnectTimeout = 15,
  isConnect = false,
  isReconnect = false,
  isReconnectOk = false,
  retryNum = 0,
  retryMaxNum = 3,
  reconnectEnable = true,
  resendEnable = false
}
local handler = GetNewHandler()

function Net.LuaMsgDispatcher(msgId, data)
  local msgName = Proto.MsgNameByID[msgId]
  print("处理消息, msgId:", msgId, ", msgName:", msgName)
  local msgHands = handler.handles[msgId]
  if nil == msgHands then
    printWarning("lua消息处理 未注册监听 ", msgId)
    Net.AddListener(msgName, ActorService.DealNothing)
    msgHands = handler.handles[msgId]
  end
  local hands = msgHands.table
  if not hands then
    return
  end
  if 0 == #hands then
    return
  end
  if nil ~= data then
    local msg = pb.decode("Msg", data)
    local head = msg.head
    local retCode = head.retCode
    local MsgWaiterObj = require("MsgWaiter")
    local isAlreadyDeal, rspCallback, errorCallback, msgCompleteCallBack
    if msgId ~= Proto.MsgIdByName.EventNotifyRsp then
      isAlreadyDeal, rspCallback, errorCallback, msgCompleteCallBack = MsgWaiterObj.ReceiveMsg(msgId, head.sequence, retCode)
      if true == isAlreadyDeal then
        print("消息已经处理过了 消息号：", head.sequence, " 消息名字：", Proto.MsgNameByID[msgId])
        return
      end
    end
    if retCode == ProtoEnum.RET_CODE.RC_OK then
      local body = pb.decode(Proto.MsgNameByID[msgId], msg.body)
      PrintTable(body, "返回数据内容：", Proto.MsgNameByID[msgId])
      if msgId == Proto.MsgIdByName.EventNotifyRsp then
        local eventTypeId = body.eventType
        local eventMsgName = Proto.EventMsgNameByID[eventTypeId]
        local eventMsgId = Proto.MsgIdByName[eventMsgName]
        local notifyBody = pb.decode(eventMsgName, body.notifyBody)
        PrintTable(notifyBody, "推送返回数据内容：")
        local eventMsgHands = handler.handles[eventMsgId]
        if eventMsgHands then
          local eventHands = eventMsgHands.table
          if eventHands and #eventHands > 0 then
            handler:RunHandles(eventHands, notifyBody)
          end
        else
          printError("lua消息处理 没有对应推送消息监听：", eventMsgId)
        end
      end
      handler:RunHandles(hands, body)
      if rspCallback then
        rspCallback(body)
      end
    else
      printError("消息返回错误信息：", Proto.MsgNameByID[msgId], " 错误码：", retCode)
      if retCode == ProtoEnum.RET_CODE.RC_RESEND_CACHE_MISS then
        LoginMgr.ReturnToLogin()
        return
      elseif retCode == ProtoEnum.RET_CODE.RC_ACTOR_BANNED then
        if UIMgr:IsWindowOpen(WinResConfig.LoginWindow.name) then
          UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_BAN)
        end
        return
      end
      if retCode == ProtoEnum.RET_CODE.RC_EXCHANGE_CODE_LEVEL_LOW or retCode == ProtoEnum.RET_CODE.RC_EXCHANGE_CODE_LEVEL_HIGH then
        local errorConfig = TableData.GetConfig(retCode, "BaseErrorCode")
        if errorConfig.text then
          FloatTipsUtil.ShowWarnTips(errorConfig.text(head.errMsg) or "")
        end
      elseif retCode ~= ProtoEnum.RET_CODE.RC_ARENA_OPPONENT_CHANGE and retCode ~= ProtoEnum.RET_CODE.RC_ARENA_TARGET_CANT_FIGHT and retCode ~= ProtoEnum.RET_CODE.RC_GUILD_IN_RECOMMEND_CD then
        local errorConfig = TableData.GetConfig(retCode, "BaseErrorCode")
        FloatTipsUtil.ShowWarnTips(errorConfig and errorConfig.text() or "")
      end
      if errorCallback then
        errorCallback(retCode)
      end
      ErrorCode.DealError(retCode)
    end
    if msgCompleteCallBack then
      ld("Guide", function()
        GuideMgr.Init()
      end)
      msgCompleteCallBack()
    end
  else
    printError("解析pb数据为空:", msgId)
    handler:RunHandles(hands, {})
  end
end

function Net.DecodePb(msgName, msg)
  return pb.decode(msgName, msg)
end

function Net.Send(sendMsgName, msg, rspCallback, errorCallback, msgSequence, isResend)
  msg = msg or {}
  PrintTable(msg, sendMsgName, "lua发送消息")
  local data = pb.encode(sendMsgName, msg)
  local msgId = Proto.MsgIdByName[sendMsgName]
  local msgData = {}
  local head = {}
  head.cmd = msgId
  head.resend = isResend
  if msgSequence then
    head.sequence = msgSequence
  else
    head.sequence = Net.msgSequence
    Net.msgSequence = Net.msgSequence + 1
  end
  if msgId > 10000 and msgId < 10099 then
    ld("Guild", function()
      head.serviceId = GuildMgr.GetServiceId()
    end)
  end
  msgSequence = head.sequence
  msgData.head = head
  msgData.body = data
  local content = pb.encode("Msg", msgData)
  SocketMgr:Send(msgId, content)
  local waitMsgName = Proto.MsgNameByID[msgId + 100000]
  if sendMsgName == Proto.MsgName.HeartBeatReq or sendMsgName == Proto.MsgName.ClientAbnormalReportReq then
  else
    MsgWaiter(waitMsgName, sendMsgName, function()
      Net.Send(sendMsgName, msg, rspCallback, errorCallback, msgSequence, true)
    end, head.sequence, rspCallback, errorCallback)
  end
end

function Net.AddListener(msgName, handle, tableObj)
  if nil == handle then
    printError("注册lua net处理失败，函数为空,消息名-->>", msgName)
    return
  end
  local id = Proto.MsgIdByName[msgName]
  if nil == id then
    printError("无效消息名-->>", msgName)
    return
  end
  handler:AddHandle(id, handle, tableObj)
end

function Net.RemoveListener(msgName, handle, tableObj)
  local id = Proto.MsgIdByName[msgName]
  if nil == id then
    printError("无效消息名-->>", msgName)
    return
  end
  handler:RemoveHandle(id, handle, tableObj)
end

function Net.OnConnected()
  print("Net.OnConnected")
  Net.isConnect = true
  if Net.isReconnect then
    print("socket 重连成功")
    Net.retryNum = 0
    Net.isReconnect = false
    Net.isReconnectOk = true
  end
  LoginMgr.canTouch = true
  LoginMgr.InitHeartBeatCheck()
  LoginService.EnterGameReq()
end

function Net.OnDisConnect()
  printWarning("Net.OnDisConnect")
  Net.isConnect = false
  LoginMgr.canTouch = true
end

function Net.OnError()
  printWarning("Net.OnError")
  Net.isConnect = false
  LoginMgr.canTouch = true
  if false == Net.reconnectEnable and (Net.isReconnect or Net.resendEnable) then
    Net.reconnectEnable = true
  end
end

function Net.ReConnect()
  if Net.reconnectEnable == false then
    return
  end
  Net.reconnectEnable = false
  Net.retryNum = Net.retryNum + 1
  print("socket 重连 重连次数", Net.retryNum, debug.traceback())
  if Net.retryNum >= Net.retryMaxNum then
    Net.retryNum = 0
    Net.isReconnect = false
    Net.reconnectEnable = false
    Net.resendEnable = false
    local MsgWaiterObj = require("MsgWaiter")
    MsgWaiterObj.HideWaitingWindow()
    MessageBox.Show(T(10643), {
      titleText = T(10645),
      touchCallback = function()
        Net.reconnectEnable = true
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
  Net.isReconnect = true
  local ip = Net.ip
  local port = Net.port
  Net.Connect(ip, port)
end

function Net.IsConnect()
  return Net.isConnect
end

function Net.IsReConnect()
  return Net.isReconnect
end

function Net.Connect(ip, port, timeout)
  Net.ip = ip
  Net.port = port
  SocketMgr:Connect(ip, port, timeout or Net.defaultConnectTimeout)
end

function Net.Init()
  SocketMgr:InitLua(Net.LuaMsgDispatcher, Net.OnConnected, Net.OnDisConnect, Net.OnError)
end

function Net.Close()
  if SocketMgr then
    SocketMgr:Close()
  end
  Net.isReconnect = false
  Net.isReconnectOk = false
  Net.retryNum = 0
  Net.reconnectEnable = true
  Net.resendEnable = false
end

Net.Init()
return Net
