ChatService = {}

function ChatService.Init()
  Net.AddListener(Proto.MsgName.SyncMessageRsp, ChatService.DealSyncMessageRsp)
  Net.AddListener(Proto.MsgName.SendMessageRsp, ChatService.DealSendMessageRsp)
  Net.AddListener(Proto.MsgName.GetChannelNewestMessageRsp, ChatService.DealGetChannelNewestMessageRsp)
  Net.AddListener(Proto.MsgName.GetWorldLineInfoRsp, ChatService.DealGetWorldLineInfoRsp)
  Net.AddListener(Proto.MsgName.SwitchWorldGroupRsp, ChatService.DealSwitchWorldGroupRsp)
  Net.AddListener(Proto.MsgName.ReportUserRsp, ChatService.DealReportUserRsp)
  Net.AddListener(Proto.MsgName.GetPrivateChattingTargetRsp, ChatService.DealGetPrivateChattingTargetRsp)
  Net.AddListener(Proto.MsgName.GetEmojiRsp, ChatService.DealGetEmojiRsp)
  Net.AddListener(Proto.MsgName.ReportLatestEmojiRsp, ChatService.DealReportLatestEmojiRsp)
  Net.AddListener(Proto.MsgName.SyncPrivateHistoryMessageRsp, ChatService.DealSyncPrivateHistoryMessageRsp)
  Net.AddListener(Proto.MsgName.ChangePrivateChattingTargetRsp, ChatService.DealChangePrivateChattingTargetRsp)
  Net.AddListener(Proto.MsgName.GetChatStateRsp, ChatService.DealGetChatStateRsp)
  Net.AddListener(Proto.MsgName.MarkMessageReadRsp, ChatService.DealMarkMessageReadRsp)
end

function ChatService.GetChannelNewestMessageReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetChannelNewestMessageReq, msg)
end

function ChatService.DealGetChannelNewestMessageRsp(msg)
  ChatData.InitMessage(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_MESSAGE_UPDATE)
end

function ChatService.SyncMessageReq(syncKey, channel)
  local msg = {}
  msg.sessionType = channel or ChatData.GetSelectChannel()
  msg.syncKey = syncKey or 0
  msg.sessionId = ChatData.GetSessionId()
  Net.Send(Proto.MsgName.SyncMessageReq, msg)
end

function ChatService.DealSyncMessageRsp(msg)
  ChatData.UpdateSyncMessage(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_MESSAGE_UPDATE, msg.sessionType)
end

function ChatService.SendMessageReq(text, channel, targetUin, msgType, emojiId)
  if string.len(text) <= 0 then
    return
  end
  if channel == ProtoEnum.IM_SESSION_TYPE.PRIVATE and nil == targetUin then
    FloatTipsUtil.ShowWarnTips(T(10106))
    return
  end
  local muted, duration, reason = ChatData.GetChatStateByChannel(channel)
  if muted then
    if duration then
      local channelMsg = ChatData.CreateSystemMsg(WindowMsgEnum.ChatWindow.E_MSG_CHANNEL_MUTED, {
        saveUin = targetUin,
        channel = channel,
        duration = duration,
        reason = reason
      })
      ChatData.CacheMessage(channel, channelMsg)
      UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY, {sessionType = channel, channelMsg = channelMsg})
    else
      local channelMsg = {}
      channelMsg.content = text
      channelMsg.sessionType = channel
      channelMsg.sessionId = ChatData.GetSessionId()
      channelMsg.msgType = msgType and msgType or ProtoEnum.MSG_TYPE.MSG_TEXT
      channelMsg.toUin = targetUin
      channelMsg.stamp = LoginData.GetCurServerTime()
      channelMsg.fromUin = ActorData.GetUin()
      channelMsg.emojiId = emojiId
      ChatData.CacheMessage(channel, channelMsg)
      UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY, {sessionType = channel, channelMsg = channelMsg})
    end
    return
  end
  local msg = {}
  msg.channelMsg = {}
  msg.channelMsg.content = text
  msg.channelMsg.sessionType = channel
  msg.channelMsg.sessionId = ChatData.GetSessionId()
  msg.channelMsg.msgType = msgType and msgType or ProtoEnum.MSG_TYPE.MSG_TEXT
  msg.channelMsg.toUin = targetUin
  msg.channelMsg.emojiId = emojiId
  Net.Send(Proto.MsgName.SendMessageReq, msg)
end

function ChatService.DealSendMessageRsp(msg)
  local channelMsg = msg.channelMsg
  if channelMsg then
    ChatData.CacheMessage(channelMsg.sessionType, channelMsg)
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY, {
      sessionType = channelMsg.sessionType,
      channelMsg = channelMsg
    })
  end
end

function ChatService.GetWorldLineInfoReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetWorldLineInfoReq, msg)
end

function ChatService.DealGetWorldLineInfoRsp(msg)
  ChatData.SetWorldLineList(msg.lineInfoLst)
  OpenWindow(WinResConfig.ChoiceLineWindow.name)
end

function ChatService.SwitchWorldGroupReq(sessionId)
  local msg = {}
  msg.dstSessionId = sessionId
  Net.Send(Proto.MsgName.SwitchWorldGroupReq, msg)
end

function ChatService.DealSwitchWorldGroupRsp(msg)
  ChatData.SetSelfLineInfo(msg.lineInfo)
  ChatData.CacheMessage(ProtoEnum.IM_SESSION_TYPE.WORLD, ChatData.CreateSystemMsg(WindowMsgEnum.ChatWindow.E_MSG_LINE_CHANGE, msg.lineInfo))
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_LINE_CHANGE)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_MESSAGE_UPDATE, ProtoEnum.IM_SESSION_TYPE.WORLD)
end

function ChatService.ReportUserReq(actorInfo, channelMsg, reasons)
  local msg = {}
  msg.sessionId = channelMsg.sessionId
  msg.content = channelMsg.content
  msg.msgId = channelMsg.msgId
  msg.reasons = reasons
  msg.targetUin = actorInfo.uin
  Net.Send(Proto.MsgName.ReportUserReq, msg)
end

function ChatService.DealReportUserRsp(msg)
  FloatTipsUtil.ShowWarnTips(T(10104))
  UIMgr:CloseWindow(WinResConfig.ComplaintWindow.name)
end

function ChatService.GetPrivateChattingTargetReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetPrivateChattingTargetReq, msg)
end

function ChatService.DealGetPrivateChattingTargetRsp(msg)
  ChatData.SetPrivateTargetList(msg.infos)
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_PRIVATE_PLAYER_UPDATE)
end

function ChatService.ChangePrivateChattingTargetReq(addUin, delUin)
  local msg = {}
  msg.addTargetUin = addUin
  msg.delTargetUin = delUin
  Net.Send(Proto.MsgName.ChangePrivateChattingTargetReq, msg)
end

function ChatService.DealChangePrivateChattingTargetRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_PRIVATE_PLAYER_UPDATE)
end

function ChatService.GetEmojiReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetEmojiReq, msg)
end

function ChatService.DealGetEmojiRsp(msg)
  ChatData.SetLatestEmojiList(msg.latestEmojiLst)
end

function ChatService.ReportLatestEmojiReq(latestEmojiLst)
  local msg = {}
  msg.latestEmojiLst = latestEmojiLst
  Net.Send(Proto.MsgName.ReportLatestEmojiReq, msg)
end

function ChatService.DealReportLatestEmojiRsp(msg)
end

function ChatService.SyncPrivateHistoryMessageReq(actorInfo)
  local msg = {}
  msg.targetUin = actorInfo.uin
  Net.Send(Proto.MsgName.SyncPrivateHistoryMessageReq, msg)
end

function ChatService.DealSyncPrivateHistoryMessageRsp(msg)
  ChatData.UpdateSenderInfos({
    msg.targetInfo
  })
  ChatData.SetCurPrivateTargetUin(msg.targetUin)
  ChatData.UpdatePrivateMsg(msg)
  ChatData.RemoveTargetFromUnreadList(msg.targetUin)
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_START_PRIVATE_CHAT, msg.targetUin)
end

function ChatService.GetChatStateReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetChatStateReq, msg)
end

function ChatService.DealGetChatStateRsp(msg)
  ChatData.SetChatState(msg)
end

function ChatService.MarkMessageReadReq(sessionType, msgId, targetUin)
  local msg = {}
  msg.targetUin = targetUin
  msg.msgId = msgId
  msg.sessionType = sessionType
  Net.Send(Proto.MsgName.MarkMessageReadReq, msg)
end

function ChatService.DealMarkMessageReadRsp(msg)
end

ChatService.Init()
