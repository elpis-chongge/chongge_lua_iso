ChatData = {}

function ChatData.InitChatData()
  ChatData.lastChannel = nil
  ChatData.selectChannel = nil
  ChatData.msgInited = false
  ChatData.cacheChatMsg = {}
  ChatData.cachePrivateMsg = {}
  ChatData.cacheSyncKey = {}
  ChatData.cacheSenderInfos = {}
  ChatData.selfLineInfo = nil
  ChatData.worldLineList = {}
  ChatData.chattingTargetList = {}
  ChatData.latestEmojiList = {}
  ChatData.cacheGuildMemberInfo = {}
  ChatData.curPrivateTargetUin = nil
  ChatData.chatState = {}
  ChatData.systemMsgStartId = 0
  ChatData.unReadTargetUinLst = {}
  ChatData.unionUnRead = false
end

ChatData.InitChatData()

function ChatData.ClearCacheMsg()
  ChatData.cacheChatMsg = {
    [ProtoEnum.IM_SESSION_TYPE.UNION] = {},
    [ProtoEnum.IM_SESSION_TYPE.WORLD] = {}
  }
  ChatData.cacheSyncKey = {}
  ChatData.cacheSenderInfos = {}
  ChatData.cachePrivateMsg = {}
end

function ChatData.RemoveTargetFromUnreadList(uin)
  local list = ChatData.unReadTargetUinLst
  for i, v in ipairs(list) do
    if v == uin then
      table.remove(list, i)
      return
    end
  end
end

function ChatData.SaveTargetFromUnreadList(uin)
  local list = ChatData.unReadTargetUinLst
  for i, v in ipairs(list) do
    if v == uin then
      return
    end
  end
  table.insert(ChatData.unReadTargetUinLst, uin)
end

function ChatData.InitMessage(msg)
  for _, v in ipairs(msg.msgList) do
    ChatData.CacheMessage(v.sessionType, v)
  end
  ChatData.SetSelfLineInfo(msg.myLineInfo)
  ChatData.UpdateSenderInfos(msg.senderInfos)
  ChatData.unReadTargetUinLst = msg.unReadTargetUinLst
  ChatData.unionUnRead = msg.unionUnRead
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CHAT)
end

function ChatData.DealNewMessageNotify(msg)
  ChatData.CacheMessage(msg.sessionType, msg.channelMsg)
  ChatData.UpdateSenderInfos({
    msg.senderInfo
  })
  if msg.sessionType == ProtoEnum.IM_SESSION_TYPE.PRIVATE then
    ChatData.UpdatePrivateTarget(msg.senderInfo)
    ChatData.SaveTargetFromUnreadList(msg.senderInfo.uin)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY, msg)
end

function ChatData.UpdateSyncMessage(msg)
  if msg.msgList then
    for i, v in ipairs(msg.msgList) do
      ChatData.CacheMessage(msg.sessionType, v)
    end
  end
  ChatData.UpdateSenderInfos(msg.senderInfos)
  ChatData.SetSyncKey(msg.sessionType, msg.syncKey)
end

function ChatData.IsMessageCached(channel, msgId)
  if nil == msgId then
    return false
  end
  local channelMessage = ChatData.cacheChatMsg[channel]
  if channelMessage then
    for i = #channelMessage, 1, -1 do
      local message = channelMessage[i]
      if message and message.msgId == msgId then
        return true, i
      end
    end
  end
  return false
end

function ChatData.CacheMessage(channel, channelMsg)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT, false) == false then
    return false
  end
  if channel == ProtoEnum.IM_SESSION_TYPE.PRIVATE then
    local fromUin = channelMsg.fromUin
    local toUin = channelMsg.toUin
    local selfUin = ActorData.GetUin()
    local saveUin = channelMsg.saveUin
    ChatData.CachePrivateMsg(saveUin or fromUin == selfUin and toUin or fromUin, channelMsg)
  else
    local isBlock = false
    ld("Friend", function()
      isBlock = FriendData.IsActorBlock(channelMsg.fromUin)
    end)
    if true == isBlock then
      return
    end
    local isCached, existIndex = ChatData.IsMessageCached(channel, channelMsg.msgId)
    if false == isCached then
      ChatData.cacheChatMsg[channel] = ChatData.cacheChatMsg[channel] or {}
      table.insert(ChatData.cacheChatMsg[channel], channelMsg)
    else
      ChatData.cacheChatMsg[channel][existIndex] = channelMsg
    end
    table.sort(ChatData.cacheChatMsg[channel], function(a, b)
      return a.stamp < b.stamp
    end)
  end
end

function ChatData.UpdatePrivateMsg(historyMessage)
  for i, v in ipairs(historyMessage.msgList) do
    ChatData.CachePrivateMsg(historyMessage.targetUin, v)
  end
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_UPDATE_PRIVATE_CHAT)
end

function ChatData.CachePrivateMsg(uin, privateMsg)
  if ChatData.cachePrivateMsg[uin] == nil then
    ChatData.cachePrivateMsg[uin] = {}
  end
  local targetPrivateMsgs = ChatData.cachePrivateMsg[uin]
  local isExist = false
  for i, v in ipairs(targetPrivateMsgs) do
    if v.msgId == privateMsg.msgId then
      isExist = true
      targetPrivateMsgs[i] = privateMsg
      break
    end
  end
  if false == isExist then
    table.insert(targetPrivateMsgs, privateMsg)
    table.sort(targetPrivateMsgs, function(a, b)
      return a.stamp < b.stamp
    end)
  end
end

function ChatData.GetPrivateMsg(targetUin)
  return ChatData.cachePrivateMsg[targetUin] or {}
end

function ChatData.GetCacheChatMsg(channel)
  if channel == ProtoEnum.IM_SESSION_TYPE.UNION then
    local guildInfo = GuildData.GuildInfo and GuildData.GuildInfo.info or GuildData.GetGuildSimpleInfo()
    if nil == guildInfo then
      return {}
    end
    if 0 == guildInfo.guildUid then
      return {}
    else
      local guildId = guildInfo.guildUid
      local msgs = ChatData.cacheChatMsg[channel]
      for i = #msgs, 1, -1 do
        local msg = msgs[i]
        if tonumber(msg.sessionId) ~= guildId then
          table.remove(msgs, i)
        end
      end
      return msgs
    end
  else
    return ChatData.cacheChatMsg[channel]
  end
end

function ChatData.SetWorldLineList(lineList)
  if lineList then
    ChatData.worldLineList = lineList
  end
end

function ChatData.GetWorldLineInfo(lineId)
  local list = ChatData.worldLineList
  for i, v in ipairs(list) do
    if v.lineId == lineId then
      return v
    end
  end
  return
end

function ChatData.GetAllWorldLineList()
  return ChatData.worldLineList
end

function ChatData.SetSelfLineInfo(lineInfo)
  ChatData.selfLineInfo = lineInfo
end

function ChatData.GetSelfLineInfo()
  return ChatData.selfLineInfo
end

function ChatData.GetSessionId()
  local lineInfo = ChatData.GetSelfLineInfo()
  if lineInfo then
    return lineInfo.sessionId
  end
end

function ChatData.UpdateSenderInfos(senderInfos)
  if senderInfos then
    for _, actorInfo in ipairs(senderInfos) do
      ChatData.cacheSenderInfos[actorInfo.uin] = actorInfo
    end
  end
end

function ChatData.GetSenderInfo(uin)
  return ChatData.cacheSenderInfos[uin]
end

function ChatData.GetNewestWorldMessage()
  local worldChannel = ChatData.cacheChatMsg[ProtoEnum.IM_SESSION_TYPE.WORLD]
  if worldChannel then
    return worldChannel[#worldChannel]
  end
end

function ChatData.IsSelfMsg(msg)
  return msg.fromUin == ActorData.GetUin()
end

function ChatData.SetSelectChannel(channel, sendUpdateMsg)
  if nil == sendUpdateMsg then
    sendUpdateMsg = true
  end
  if ChatData.selectChannel and ChatData.selectChannel ~= channel then
    ChatData.lastChannel = ChatData.selectChannel
  end
  ChatData.selectChannel = channel
  if sendUpdateMsg then
    UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_CHANNEL_CHANGE)
  end
end

function ChatData.GetSelectChannel()
  return ChatData.selectChannel or ProtoEnum.IM_SESSION_TYPE.WORLD
end

function ChatData.GetLastChannel()
  return ChatData.lastChannel
end

function ChatData.GetSyncKey(channel)
  return ChatData.cacheSyncKey[channel] or 0
end

function ChatData.SetSyncKey(channel, syncKey)
  ChatData.cacheSyncKey[channel] = syncKey
end

function ChatData.CreateSystemMsg(windowMsgId, data)
  if windowMsgId == WindowMsgEnum.ChatWindow.E_MSG_LINE_CHANGE then
    local lineInfo = data
    local msg = {
      content = T(10079, T(10080, lineInfo.lineId)),
      stamp = LoginData.GetCurServerTime(),
      msgId = ChatData.GetSystemMsgId()
    }
    return msg
  elseif windowMsgId == WindowMsgEnum.ChatWindow.E_MSG_CHANNEL_MUTED then
    local reason = TableData.GetConfig(data.reason, "BaseErrorCode").text()
    local msg = {
      content = T(10117, reason, TimeUtil.FormatTime(data.duration)),
      stamp = LoginData.GetCurServerTime(),
      msgId = ChatData.GetSystemMsgId(),
      saveUin = data.saveUin
    }
    return msg
  end
end

function ChatData.GetSystemMsgId()
  ChatData.systemMsgStartId = ChatData.systemMsgStartId + 1
  return ChatData.systemMsgStartId
end

function ChatData.SetPrivateTargetList(targetList)
  ChatData.chattingTargetList = targetList
  ChatData.UpdateSenderInfos(targetList)
end

function ChatData.GetPrivateTargetList()
  return ChatData.chattingTargetList
end

function ChatData.UpdatePrivateTarget(target)
  local chatList = ChatData.GetPrivateTargetList()
  if chatList then
    for i, v in ipairs(chatList) do
      if v.uin == target.uin then
        table.remove(chatList, i)
        break
      end
    end
    table.insert(chatList, 1, target)
  end
end

function ChatData.RemovePrivateTarget(target)
  local chattingList = ChatData.GetPrivateTargetList()
  for i, v in ipairs(chattingList) do
    if v.uin == target.uin then
      table.remove(chattingList, i)
      ChatService.ChangePrivateChattingTargetReq(nil, target.uin)
      return
    end
  end
end

function ChatData.SetCurPrivateTargetUin(uin)
  ChatData.curPrivateTargetUin = uin
  local actorInfo = ChatData.GetSenderInfo(uin)
  local chattingList = ChatData.GetPrivateTargetList()
  local isExist = false
  local maxCount = TableData.GetConfig(70010601, "BaseFixed").int_value
  for i, v in ipairs(chattingList) do
    if v.uin == uin then
      isExist = true
      break
    end
  end
  local addUin, delUin
  if false == isExist then
    addUin = uin
  end
  if maxCount <= #chattingList then
    delUin = chattingList[#chattingList].uin
  end
  if false == isExist then
    table.insert(chattingList, 1, actorInfo)
  end
  if addUin or delUin then
    ChatService.ChangePrivateChattingTargetReq(addUin, delUin)
  end
end

function ChatData.GetCurPrivateTargetUin()
  return ChatData.curPrivateTargetUin
end

function ChatData.GetCurPrivateTarget()
  local uin = ChatData.GetCurPrivateTargetUin()
  if uin then
    return ChatData.GetSenderInfo(uin)
  end
end

function ChatData.SetLatestEmojiList(emojiList)
  ChatData.latestEmojiList = emojiList
end

function ChatData.GetLatestEmojiList()
  return ChatData.latestEmojiList
end

function ChatData.UpdateLatestEmoji(emojiStr)
  if nil == emojiStr or string.len(emojiStr) <= 0 then
    return
  end
  local emojiList = ChatData.GetLatestEmojiList()
  if emojiList then
    for i, v in ipairs(emojiList) do
      if v == emojiStr then
        table.remove(emojiList, i)
        break
      end
    end
    table.insert(emojiList, 1, emojiStr)
    ChatService.ReportLatestEmojiReq(emojiList)
  end
end

function ChatData.InitEmoji()
  local emojiInfoMap = {}
  local emojiInfoList = {}
  local emojiConfig = TableData.GetTable("BaseEmoji")
  for i, v in pairs(emojiConfig) do
    if v.unlock_tag == nil then
      if nil == emojiInfoMap[v.group_id] then
        local groupConfig = TableData.GetConfig(v.group_id, "BaseEmojiGroup")
        emojiInfoMap[v.group_id] = {
          id = groupConfig.id,
          icon = groupConfig.icon,
          emojiList = {},
          sort = groupConfig.sort
        }
      end
      table.insert(emojiInfoMap[v.group_id].emojiList, {
        id = v.id,
        path = v.path,
        sort = v.sort
      })
    end
  end
  local itemList = ActorData.GetItemListByType(ProtoEnum.ITEM_TYPE.EMOJI)
  for _, itemInfo in ipairs(itemList) do
    local emojiId = tonumber(itemInfo.itemConfig.effect_value)
    local config = emojiConfig[emojiId]
    if config then
      if nil == emojiInfoMap[config.group_id] then
        local groupConfig = TableData.GetConfig(config.group_id, "BaseEmojiGroup")
        emojiInfoMap[config.group_id] = {
          id = groupConfig.id,
          icon = groupConfig.icon,
          emojiList = {},
          sort = groupConfig.sort
        }
      end
      table.insert(emojiInfoMap[config.group_id].emojiList, {
        id = emojiId,
        path = config.path,
        sort = config.sort
      })
    end
  end
  for i, v in pairs(emojiInfoMap) do
    table.sort(v.emojiList, function(a, b)
      return a.sort < b.sort
    end)
    table.insert(emojiInfoList, v)
  end
  table.sort(emojiInfoList, function(a, b)
    return a.sort < b.sort
  end)
  return emojiInfoList
end

function ChatData.GetCurGroupEmoji(allEmoji, groupId)
  for i, v in ipairs(allEmoji) do
    if v.id == groupId then
      return v.emojiList
    end
  end
end

function ChatData.SetGuildMemberList(guildMemberRsp)
  ChatData.cacheGuildMemberInfo = SimpleCopy(guildMemberRsp)
  local members = ChatData.cacheGuildMemberInfo.members
  for i, v in ipairs(members) do
    if v.uin == ActorData.GetUin() then
      table.remove(members, i)
      return
    end
  end
end

function ChatData.GetGuildMemberList()
  return ChatData.cacheGuildMemberInfo.members
end

function ChatData.SetChatState(msg)
  msg.recordStamp = LoginData.GetCurServerTime()
  ChatData.chatState = msg
end

function ChatData.GetChatState()
  return ChatData.chatState
end

function ChatData.GetChatStateByChannel(channel)
  local muted = false
  local chatState = ChatData.GetChatState()
  if chatState.mute and 0 == chatState.durationInSec then
    return true, nil, chatState.muteReason
  end
  for i, v in ipairs(chatState.muteChannels) do
    if v == channel then
      muted = true
      break
    end
  end
  local duration = chatState.durationInSec + chatState.recordStamp - LoginData.GetCurServerTime()
  if duration > 0 then
    return muted, duration, chatState.muteReason
  else
    return false
  end
end
